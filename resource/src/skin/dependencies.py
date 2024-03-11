from fastapi import Depends

from dependies import create_uow
from services.unit_of_work import IUnitOfWork
from skin.service import SkinService


def create_skin_service(
    uow: IUnitOfWork = Depends(create_uow),
):
    return SkinService(uow)