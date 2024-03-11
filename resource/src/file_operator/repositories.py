from abc import ABC, abstractmethod
from typing import Optional
from sqlalchemy import Integer, select
from sqlalchemy.ext.asyncio import AsyncSession

from db.models import *
from db.repositories.generic import GenericRepository
from db.repositories.generic_sqlalchemy import GenericSqlRepository


class IFileRepository(GenericRepository[FileModel], ABC):
    @abstractmethod
    async def get_image_by_role(role_id: int):
        raise NotImplementedError()


class FileRepository(GenericSqlRepository[FileModel], IFileRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, FileModel)

    async def get_image_by_role(self, role_id: int):
        stmt = select(FileModel).filter(FileModel.details['role_id'].as_string().cast(Integer) == role_id)
        stmt = await self._execute_statement_get_one(stmt)
        return stmt
