from authentication.constants import ACCESS_TOKEN
from authentication.exceptions import *
from authentication.service import AuthenticationService
from authorization.exceptions import *
from authorization.checkers import *
from authorization.informants import *
from authorization.schemas import *
from db.exceptions import DBException
from services.unit_of_work import IUnitOfWork


class AuthorizationService:
    def __init__(
        self,
        uow: IUnitOfWork,
        authenticate_service: AuthenticationService,
        resource_InformantService: IResourceInformantService,
        action_InformantService: IActionInformantService,
        subject_InformantService: ISubjectInformantService,
    ):
        self.__uow = uow
        self.__authenticate_service = authenticate_service
        self.__checkers: list[BaseCheckerAuthService] = [
            RoleCheckerAuthService(),
            RoleOwnerCheckerAuthService(),
        ]
        self.__resource_InformantService = resource_InformantService
        self.__action_InformantService = action_InformantService
        self.__subject_InformantService = subject_InformantService

    async def check_authorization(
        self, action: str, resource: ResourceData, token_item: TokenItemData
    ):
        try:
            token_data = self.__authenticate_service.decode_token(
                token_item.token, ACCESS_TOKEN
            )
            async with self.__uow:
                subject_data = await self.__subject_InformantService.get(
                    SubjectData(
                        id=token_data.id,
                        role_id=token_data.role_id,
                        item_id=token_item.id,
                    ),
                    self.__uow,
                )
                resource_data = await self.__resource_InformantService.get(resource)
                action_data = await self.__action_InformantService.get(action)

                for checker in self.__checkers:
                    result: StatusAccess = checker.check(
                        action_data, resource_data, subject_data
                    )
                    if result.value:
                        return resource_data, subject_data
                raise NoAccessAuthorizationException()
        except DBException as db_e:
            raise DBAuthorizationException(db_e.message) from db_e
