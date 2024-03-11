from abc import ABC, abstractmethod
from sqlalchemy import or_
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from typing import List, Optional
from sqlalchemy.orm import selectinload
from datetime import datetime

from db.models import *
from db.repositories.generic_sqlalchemy import GenericSqlRepository
from db.repositories.generic import GenericRepository
from db.exceptions import *
from user.exceptions import *


class IUserRepository(GenericRepository[User], ABC):
    @abstractmethod
    async def get_by_id(self, id: int) -> Optional[User]:
        raise NotImplementedError()

    @abstractmethod
    async def get_by_id_full(self, id: int) -> Optional[User]:
        raise NotImplementedError()

    @abstractmethod
    async def get_all(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        role_id: int | None,
    ):
        raise NotImplementedError()


class UserRepository(GenericSqlRepository[User], IUserRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, User)

    async def get_by_id(self, id: int) -> Optional[User]:
        stmt = self._construct_statement_get_by_id(id)
        stmt = stmt.options(
            selectinload(User.role),
        )
        return await self._execute_statement_get_by_id(stmt, id)

    async def get_by_id_full(self, id: int) -> Optional[User]:
        stmt = self._construct_statement_get_by_id(id)
        stmt = stmt.options(
            selectinload(User.role),
            selectinload(User.favourites).selectinload(Favourite.legend),
        )
        return await self._execute_statement_get_by_id(stmt, id)

    async def get_all(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        role_id: int | None,
    ):
        stmt = self._construct_statement_get_all(offset, limit)
        stmt = stmt.options(
            selectinload(User.role),
        )
        stmt = self._add_substr_to_stmt(stmt, User.nickname, substr)
        if role_id is not None:
            stmt = stmt.filter(User.role_id == role_id)
        return await self._execute_statement_get_all(stmt)


class IApplicationRepository(GenericRepository[Application], ABC):
    @abstractmethod
    async def get_all(self, offset, limit, user_id: int | None):
        raise NotImplementedError()


class ApplicationRepository(GenericSqlRepository[Application], IApplicationRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Application)

    async def get_all(self, offset, limit, user_id: int | None):
        stmt = self._construct_statement_get_all(offset, limit)
        stmt = stmt.options(selectinload(Application.user).selectinload(User.role))
        if user_id:
            stmt = stmt.filter(Application.default_user_id == user_id)
        return await self._execute_statement_get_all(stmt)


class IFavouriteRepository(GenericRepository[Favourite], ABC):
    pass


class FavouriteRepository(GenericSqlRepository[Favourite], IFavouriteRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Favourite)


class IReviewRepository(GenericRepository[Review], ABC):
    @abstractmethod
    async def get_all_full(
        self,
        limit: int | None,
        offset: int | None,
        legend_id: int | None,
        user_id: int | None,
        type_id: int | None,
    ):
        raise NotImplementedError()


class ReviewRepository(GenericSqlRepository[Review], IReviewRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Review)

    async def get_all_full(
        self,
        limit: int | None,
        offset: int | None,
        legend_id: int | None,
        user_id: int | None,
        type_id: int | None,
    ):
        stmt = self._construct_statement_get_all(offset, limit)
        stmt = stmt.options(
            selectinload(Review.legend),
            selectinload(Review.user),
            selectinload(Review.likes),
        )
        if legend_id:
            stmt = stmt.filter(Review.legend_id == legend_id)
        if user_id:
            stmt = stmt.filter(Review.user_id == user_id)
        if type_id:
            stmt = stmt.filter(Review.type_id == type_id)
        return await self._execute_statement_get_all(stmt)


class ILikeRepository(GenericRepository[Like], ABC):
    pass


class LikeRepository(GenericSqlRepository[Like], ILikeRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Like)
