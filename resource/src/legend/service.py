from db.exceptions import *
from db.models.legend import Legend
from db.models.legend_stat import LegendStat
from db.models.weapon import Weapon
from db.models.weapon_legend import WeaponLegend
from legend.exceptions import StatsException, WeaponsException, LegendsException
from legend.phrases import *
from schemas.legend import (
    LegendFullSchema,
    LegendShortSchema,
    LegendSchema,
    LegendPostSchema,
    LegendPutSchema,
)
from schemas.message import MessageSchema
from schemas.response_items import ResponseItemsSchema
from schemas.stat import StatSchema
from schemas.weapon import WeaponPostSchema, WeaponSchema
from schemas.weapon_skin import WeaponSkinGetSchema
from services.unit_of_work import IUnitOfWork
from utils import check_count_items, check_exist_items


class LegendService:
    def __init__(self, uow: IUnitOfWork):
        self.__uow = uow

    async def get_all_stats(self) -> ResponseItemsSchema[StatSchema]:
        async with self.__uow:
            try:
                stats = await self.__uow.stats.get_all()
                l = check_count_items(stats, STATS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [StatSchema.from_orm(s) for s in stats], None, l
                )
            except GetAllItemsException as e:
                raise StatsException(e.message) from e

    async def get_all_legends_full(
        self,
        substr: str | None,
        weapon_ids: list[int] | None,
        cost: int | None,
        strength: int | None,
        dexterity: int | None,
        defense: int | None,
        speed: int | None,
    ) -> ResponseItemsSchema[LegendShortSchema]:
        async with self.__uow:
            try:
                legends = await self.__uow.legends.get_all_full(
                    substr,
                    weapon_ids,
                    cost,
                    strength,
                    dexterity,
                    defense,
                    speed,
                )
                l = check_count_items(legends, LEGENDS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [LegendShortSchema.from_orm(l) for l in legends], 0, l
                )
            except GetAllItemsException as e:
                raise LegendsException(e.message) from e

    async def get_all_legends(self) -> ResponseItemsSchema[LegendSchema]:
        async with self.__uow:
            try:
                legends = await self.__uow.legends.get_all(None, None)
                l = check_count_items(legends, LEGENDS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [LegendSchema.from_orm(l) for l in legends], 0, l
                )
            except GetAllItemsException as e:
                raise LegendsException(e.message) from e

    async def get_all_weapons(self) -> ResponseItemsSchema[WeaponSchema]:
        async with self.__uow:
            try:
                weapons = await self.__uow.weapons.get_all()
                l = check_count_items(weapons, WEAPONS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [WeaponSchema.from_orm(w) for w in weapons], None, l
                )
            except GetAllItemsException as e:
                raise WeaponsException(e.message) from e

    async def get_legend_by_id(self, id: int) -> LegendFullSchema:
        async with self.__uow:
            try:
                legend = await self.__uow.legends.get_by_id_full(id)
                check_exist_items(legend, LEGEND_NOT_FOUND)
                return LegendFullSchema.from_orm(legend)
            except GetItemByIdException as e:
                raise LegendsException(e.message) from e

    async def get_all_weapon_skins(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        weapon_type_ids: list[int] | None,
        legend_id: int | None,
        event_ids: list[int] | None,
        chest_ids: list[int] | None,
    ) -> ResponseItemsSchema[WeaponSkinGetSchema]:
        async with self.__uow:
            try:
                weapon_skins = await self.__uow.weapon_skins.get_all_full(
                    limit,
                    offset,
                    substr,
                    weapon_type_ids,
                    legend_id,
                    event_ids,
                    chest_ids,
                )
                l = check_count_items(weapon_skins, WEAPON_SKINS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [WeaponSkinGetSchema.from_orm(w_s) for w_s in weapon_skins], None, l
                )
            except GetAllItemsException as e:
                raise WeaponsException(e.message) from e

    async def post_weapon(self, weapon: WeaponPostSchema):
        async with self.__uow:
            try:
                weapon_db = Weapon(name=weapon.name, img=weapon.img)
                await self.__uow.weapons.add(weapon_db)
                await self.__uow.commit()
                return MessageSchema(message=WEAPON_ADD_SUCCESS)
            except AddItemException as e:
                raise WeaponsException(message=WEAPON_ADD_FAILED) from e

    async def post_legend(self, legend: LegendPostSchema):
        async with self.__uow:
            try:
                weapons_db = [
                    WeaponLegend(weapon_id=w.weapon_id, img=w.img, name=w.name)
                    for w in legend.weapons
                ]
                stats_db = [
                    LegendStat(stat_id=s.stat_id, value=s.value) for s in legend.stats
                ]
                legend_db = Legend(
                    name=legend.name,
                    aka_name=legend.aka_name,
                    description=legend.description,
                    cost=legend.cost,
                    img_main=legend.img_main,
                    img_short=legend.img_short,
                    release_info=legend.release_info,
                    weapons=weapons_db,
                    stats=stats_db,
                )
                await self.__uow.legends.add(legend_db)
                await self.__uow.commit()
                return MessageSchema(message=LEGEND_ADD_SUCCESS)
            except UniqueViolationException as e:
                raise LegendsException(message=LEGEND_ADD_FAILED) from e
            except ForeignKeyViolationException as e:
                raise LegendsException(message=LEGEND_ADD_FAILED) from e
            except AddItemException as e:
                raise LegendsException(message=LEGEND_ADD_FAILED) from e

    async def delete_legend(self, legend_id: int):
        async with self.__uow:
            try:
                legend_exist = await self.__uow.legends.get_by_id(legend_id)
                check_exist_items(legend_exist, LEGEND_NOT_FOUND)
                await self.__uow.legends.delete(id=legend_id)
                await self.__uow.commit()
                return MessageSchema(message=LEGEND_DELETE_SUCCESS)
            except DeleteItemException as e:
                raise LegendsException(message=LEGEND_DELETE_FAILED) from e

    async def put_legend(self, legend: LegendPutSchema):
        async with self.__uow:
            try:
                legend_db = await self.__uow.legends.get_by_id(legend.id)
                check_exist_items(legend_db, LEGEND_NOT_FOUND)
                legend_db.name = legend.name
                legend_db.aka_name = legend.aka_name
                legend_db.description = legend.description
                legend_db.cost = legend.cost
                legend_db.img_main = legend.img_main
                legend_db.img_short = legend.img_short
                legend_db.release_info = legend.release_info
                if legend.weapons[0].weapon_id == legend.weapons[1].weapon_id:
                    raise LegendsException()
                for w in legend.weapons:
                    w_db = await self.__uow.weapon_legends.get_one(
                        legend_id=legend.id, weapon_id=w.weapon_id
                    )
                    w_db.img = w.img
                    w_db.name = w.name
                stat_dif_set = set()
                for s in legend.stats:
                    stat_dif_set.add(s.stat_id)
                    s_db = await self.__uow.legend_stats.get_one(
                        legend_id=legend.id, stat_id=s.stat_id
                    )
                    s_db.value = s.value
                if len(stat_dif_set) != 4:
                    raise LegendsException()
                await self.__uow.commit()
                return MessageSchema(message=LEGEND_UPDATE_SUCCESS)
            except ForeignKeyViolationException as e:
                raise LegendsException(message=LEGEND_UPDATE_FAILED) from e
            except Exception as e:
                raise LegendsException(message=LEGEND_UPDATE_FAILED) from e
