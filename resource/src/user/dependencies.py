from fastapi import Depends

from dependies import create_uow
from services.unit_of_work import IUnitOfWork
from user.service import UserService


def create_user_service(
    uow: IUnitOfWork = Depends(create_uow),
):
    return UserService(uow)