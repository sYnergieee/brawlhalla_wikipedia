from fastapi import Depends

from legend.service import LegendService
from dependies import create_uow
from services.unit_of_work import IUnitOfWork


def create_legend_service(
    uow: IUnitOfWork = Depends(create_uow),
):
    return LegendService(uow)