from fastapi import Depends

from authentication.service import AuthenticationService
from dependies import create_uow
from services.unit_of_work import IUnitOfWork


def create_authentication_service(
    uow: IUnitOfWork = Depends(create_uow),
):
    return AuthenticationService(uow)
