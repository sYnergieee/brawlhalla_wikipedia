from abc import ABC, abstractmethod

from authentication.schemas import TokenDataSchema
from authorization.schemas import *
from db.exceptions import GetItemByIdException
from exceptions import NotFoundException
from services.unit_of_work import IUnitOfWork
from user.phrases import *


class ISubjectInformantService(ABC):
    @abstractmethod
    async def get(self, subject_data: SubjectData, uow: IUnitOfWork) -> SubjectData:
        raise NotImplementedError()


class IActionInformantService(ABC):
    @abstractmethod
    async def get(self, name: str) -> ActionData:
        raise NotImplementedError()


class IResourceInformantService(ABC):
    @abstractmethod
    async def get(self, resource: ResourceData) -> ResourceData:
        raise NotImplementedError()


class AbstractUserInformantService(ISubjectInformantService):
    async def get(self, subject_data: SubjectData, uow: IUnitOfWork) -> SubjectData:
        return subject_data


class ActionInformantService(IActionInformantService):
    async def get(self, name: str) -> ActionData:
        return ActionData(name=name)


class DefaultResourceInformantService(IResourceInformantService):
    async def get(self, resource: ResourceData) -> ResourceData:
        return resource


class ApplicationSubjectInformantService(ISubjectInformantService):
    async def get(self, subject_data: SubjectData, uow: IUnitOfWork) -> SubjectData:
        try:
            appl_db = await uow.applications.get_by_id(subject_data.item_id)
            if appl_db is None:
                raise NotFoundException(APPLICATION_NOT_FOUND)
            subject_data.owner_id = appl_db.default_user_id
            return subject_data
        except Exception as e:
            raise e


class ReviewSubjectInformantService(ISubjectInformantService):
    async def get(self, subject_data: SubjectData, uow: IUnitOfWork) -> SubjectData:
        try:
            review_db = await uow.reviews.get_by_id(subject_data.item_id)
            if review_db is None:
                raise NotFoundException(REVIEW_NOT_FOUND)
            subject_data.owner_id = review_db.user_id
            return subject_data
        except Exception as e:
            raise e


class UserSubjectInformantService(ISubjectInformantService):
    async def get(self, subject_data: SubjectData, uow: IUnitOfWork) -> SubjectData:
        try:
            subject_data.owner_id = subject_data.item_id
            return subject_data
        except Exception as e:
            raise e
