from abc import ABC, abstractmethod
from sqlalchemy.ext.asyncio import AsyncSession
from typing import List, Optional
from sqlalchemy.orm import selectinload
from sqlalchemy import and_, select, union_all

from db.models import *
from db.repositories.generic import GenericRepository
from db.repositories.generic_sqlalchemy import GenericSqlRepository
from legend.phrases import SPEED, STRENGHT, DEXTERITY, DEFENSE


class ILegendRepository(GenericRepository[Legend], ABC):
    @abstractmethod
    async def get_all_full(
        self,
        substr: str | None,
        weapon_ids: list[int] | None,
        cost: int | None,
        strength: int | None,
        dexterity: int | None,
        defense: int | None,
        speed: int | None,
    ) -> List[Stat]:
        raise NotImplementedError()

    @abstractmethod
    async def get_by_id_full(self, id: int) -> [Legend]:
        raise NotImplementedError()


class LegendRepository(GenericSqlRepository[Legend], ILegendRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Legend)

    async def get_all_full(
        self,
        substr: str | None,
        weapon_ids: list[int] | None,
        cost: int | None,
        strength: int | None,
        dexterity: int | None,
        defense: int | None,
        speed: int | None,
    ) -> List[Legend]:
        stmt = self._construct_statement_get_all(None, None)
        stmt = stmt.options(
            selectinload(Legend.stats).selectinload(LegendStat.stat),
            selectinload(Legend.weapons).selectinload(WeaponLegend.weapon),
        ).order_by(Legend.name)
        stmt = self._add_substr_to_stmt(stmt, Legend.name, substr)
        if weapon_ids is not None:
            for weapon in weapon_ids:
                sub = self._constructor_subquery(
                    WeaponLegend, [Weapon], weapon_id=weapon
                )
                stmt = stmt.join(sub)
        if cost is not None:
            stmt = stmt.where(Legend.cost <= cost)
        if strength is not None:
            sub = (
                select(LegendStat)
                .where(
                    and_(LegendStat.value >= strength, LegendStat.stat_id == STRENGHT)
                )
                .subquery()
            )
            stmt = stmt.join(sub)
        if dexterity is not None:
            sub = (
                select(LegendStat)
                .where(
                    and_(LegendStat.value >= dexterity, LegendStat.stat_id == DEXTERITY)
                )
                .subquery()
            )
            stmt = stmt.join(sub)
        if defense is not None:
            sub = (
                select(LegendStat)
                .where(and_(LegendStat.value >= defense, LegendStat.stat_id == DEFENSE))
                .subquery()
            )
            stmt = stmt.join(sub)
        if speed is not None:
            sub = (
                select(LegendStat)
                .where(and_(LegendStat.value >= speed, LegendStat.stat_id == SPEED))
                .subquery()
            )
            stmt = stmt.join(sub)
        return await self._execute_statement_get_all(stmt)

    async def get_by_id_full(self, id: int) -> Legend:
        stmt = self._construct_statement_get_by_id(id)
        stmt = stmt.options(
            selectinload(Legend.stats).selectinload(LegendStat.stat),
            selectinload(Legend.stats).selectinload(LegendStat.stat_img),
            selectinload(Legend.weapons).selectinload(WeaponLegend.weapon),
            selectinload(Legend.skins)
            .selectinload(Skin.events)
            .selectinload(EventSkin.event),
            selectinload(Legend.skins)
            .selectinload(Skin.chests)
            .selectinload(ChestSkin.chest),
            selectinload(Legend.reviews),
        )
        return await self._execute_statement_get_by_id(stmt, id)


class IStatRepository(GenericRepository[Stat], ABC):
    pass


class StatRepository(GenericSqlRepository[Stat], IStatRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Stat)


class IWeaponRepository(GenericRepository[Weapon], ABC):
    pass


class WeaponRepository(GenericSqlRepository[Weapon], IWeaponRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, Weapon)


class IWeaponSkinsRepository(GenericRepository[WeaponSkin], ABC):
    @abstractmethod
    async def get_all_full(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        weapon_type_ids: list[int] | None,
        legend_id: int | None,
        event_ids: list[int] | None,
        chest_ids: list[int] | None,
    ):
        raise NotImplementedError()


class WeaponSkinsRepository(GenericSqlRepository[WeaponSkin], IWeaponSkinsRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, WeaponSkin)

    async def get_all_full(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        weapon_type_ids: list[int] | None,
        legend_id: int | None,
        event_ids: list[int] | None,
        chest_ids: list[int] | None,
    ):
        stmt = self._construct_statement_get_all(offset, limit)
        stmt = stmt.options(
            selectinload(WeaponSkin.skin).selectinload(Skin.legend),
            selectinload(WeaponSkin.skin).selectinload(Skin.chests),
            selectinload(WeaponSkin.skin).selectinload(Skin.events),
            selectinload(WeaponSkin.weapon)
        )
        stmt = self._add_substr_to_stmt(stmt, WeaponSkin.name, substr)
        if weapon_type_ids:
            stmt = stmt.filter(WeaponSkin.weapon_id.in_(weapon_type_ids))
        sub = self._constructor_subquery(Skin, [])
        stmt = stmt.join(sub)
        if legend_id:
            sub = self._constructor_subquery(Skin, [], legend_id=legend_id)
            stmt = stmt.join(sub)
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


class ILegendStatRepository(GenericRepository[LegendStat], ABC):
    pass


class LegendStatRepository(GenericSqlRepository[LegendStat], ILegendStatRepository):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, LegendStat)


class IWeaponLegendRepository(GenericRepository[WeaponLegend], ABC):
    pass


class WeaponLegendRepository(
    GenericSqlRepository[WeaponLegend], IWeaponLegendRepository
):
    def __init__(self, session: AsyncSession) -> None:
        super().__init__(session, WeaponLegend)
