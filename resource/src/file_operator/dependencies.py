from fastapi import Depends

from dependies import *
from file_operator.service import FileService
from services.unit_of_work import IUnitOfWork


def create_file_service(
    uow: IUnitOfWork = Depends(create_uow),
):
    return FileService(uow)

