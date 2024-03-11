from abc import ABC, abstractmethod
from sqlalchemy.ext.asyncio import AsyncSession
from typing import List, Optional
from sqlalchemy.orm import selectinload
from sqlalchemy import and_, select, union_all
from sqlalchemy.sql import union

from db.repositories.generic import GenericRepository
from db.models import *
from db.repositories.generic_sqlalchemy import GenericSqlRepository


class ISkinRepository(GenericRepository[Skin], ABC):
    @abstractmethod
    async def get_all_full(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        legend_id: int | None,
        is_exclusive: bool | None,
        is_crossover: bool | None,
        event_ids: list[int] | None,
        chest_ids: list[int] | None,
    ):
        raise NotImplementedError()

    @abstractmethod
    async def get_by_id_full(
        self,
        id: int,
    ):
        raise NotImplementedError()


class SkinRepository(GenericSqlRepository[Skin], ISkinRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Skin)

    async def get_all_full(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        legend_id: int | None,
        is_exclusive: bool | None,
        is_crossover: bool | None,
        event_ids: list[int] | None,
        chest_ids: list[int] | None,
    ):
        stmt = self._construct_statement_get_all(offset, limit)
        stmt = stmt.options(
            selectinload(Skin.events).selectinload(EventSkin.event),
            selectinload(Skin.chests).selectinload(ChestSkin.chest),
        )
        stmt = self._add_substr_to_stmt(stmt, Skin.name, substr)
        if legend_id:
            stmt = stmt.filter(Skin.legend_id == legend_id)
        if is_exclusive is not None:
            stmt = stmt.filter(Skin.is_exclusive == is_exclusive)
        if is_crossover is not None:
            stmt = stmt.filter(Skin.is_crossover == is_crossover)
        if event_ids and chest_ids:
            sub_stmt1 = select(EventSkin).filter(EventSkin.event_id.in_(event_ids))
            sub_stmt2 = select(ChestSkin).filter(ChestSkin.chest_id.in_(chest_ids))
            sub_stmt = union_all(sub_stmt1, sub_stmt2).subquery()
            stmt = stmt.join(sub_stmt)
        elif event_ids:
            sub_stmt = (
                select(EventSkin).filter(EventSkin.event_id.in_(event_ids)).subquery()
            )
            stmt = stmt.join(sub_stmt)
        elif chest_ids:
            sub_stmt = (
                select(ChestSkin).filter(ChestSkin.chest_id.in_(chest_ids)).subquery()
            )
            stmt = stmt.join(sub_stmt)
        return await self._execute_statement_get_all(stmt)

    async def get_by_id_full(
        self,
        id: int,
    ):
        stmt = self._construct_statement_get_by_id(id)
        stmt = stmt.options(
            selectinload(Skin.legend),
            selectinload(Skin.weapons).selectinload(WeaponSkin.weapon),
            selectinload(Skin.events).selectinload(EventSkin.event),
            selectinload(Skin.chests).selectinload(ChestSkin.chest),
        )
        return await self._execute_statement_get_by_id(stmt, id)


class IChestRepository(GenericRepository[Chest], ABC):
    @abstractmethod
    async def get_by_id_full(self, id: int) -> [Chest]:
        raise NotImplementedError()


class ChestRepository(GenericSqlRepository[Chest], IChestRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Chest)

    async def get_by_id_full(self, id: int) -> Chest:
        stmt = self._construct_statement_get_by_id(id)
        stmt = stmt.options(selectinload(Chest.skins).selectinload(ChestSkin.skin))
        return await self._execute_statement_get_by_id(stmt, id)


class IEventRepository(GenericRepository[Event], ABC):
    @abstractmethod
    async def get_by_id_full(self, id: int) -> [Event]:
        raise NotImplementedError()


class EventRepository(GenericSqlRepository[Event], IEventRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Event)

    async def get_by_id_full(self, id: int) -> Event:
        stmt = self._construct_statement_get_by_id(id)
        stmt = stmt.options(selectinload(Event.skins).selectinload(EventSkin.skin))
        return await self._execute_statement_get_by_id(stmt, id)


class IChestSkinRepository(GenericRepository[ChestSkin], ABC):
    pass


class ChestSkinRepository(GenericSqlRepository[ChestSkin], IChestSkinRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, ChestSkin)


class IEventSkinRepository(GenericRepository[EventSkin], ABC):
    pass


class EventSkinRepository(GenericSqlRepository[EventSkin], IEventSkinRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, EventSkin)
