from db.exceptions import *
from db.models import *
from legend.phrases import LEGEND_NOT_FOUND, WEAPON_NOT_COMPARE
from schemas.chest import ChestPostSchema, ChestSchema
from schemas.chest_skin import ChestSkinDeleteSchema
from schemas.event import EventPostSchema, EventSchema
from schemas.event_skin import EventSkinDeleteSchema
from schemas.legend import SkinGetByIdSchema, SkinPostSchema, SkinPutSchema
from schemas.message import MessageSchema
from schemas.response_items import ResponseItemsSchema
from schemas.skin import ChestFullSchema, EventFullSchema, SkinSchema, SkinLegendFullSchema
from services.unit_of_work import IUnitOfWork
from skin.exceptions import *
from skin.phrases import *
from utils import check_count_items, check_exist_items


class SkinService:
    def __init__(self, uow: IUnitOfWork):
        self.__uow = uow

    async def get_all_skins(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        legend_id: int | None,
        is_exclusive: bool | None,
        is_crossover: bool | None,
        event_ids: list[int] | None,
        chest_ids: list[int] | None,
    ) -> ResponseItemsSchema[SkinLegendFullSchema]:
        async with self.__uow:
            try:
                skins = await self.__uow.skins.get_all_full(
                    limit,
                    offset,
                    substr,
                    legend_id,
                    is_exclusive,
                    is_crossover,
                    event_ids,
                    chest_ids,
                )
                l = check_count_items(skins, SKINS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [SkinLegendFullSchema.from_orm(s) for s in skins], None, l
                )
            except GetAllItemsException as e:
                raise SkinsException(e.message) from e

    async def get_skin_by_id(self, id: int) -> SkinGetByIdSchema:
        async with self.__uow:
            try:
                skin = await self.__uow.skins.get_by_id_full(id)
                check_exist_items(skin, SKIN_NOT_FOUND)
                return SkinGetByIdSchema.from_orm(skin)
            except GetItemByIdException as e:
                raise SkinsException(SKIN_NOT_FOUND) from e

    async def get_all_chests(self) -> ResponseItemsSchema[ChestSchema]:
        async with self.__uow:
            try:
                chests = await self.__uow.chests.get_all()
                l = check_count_items(chests, CHESTS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [ChestSchema.from_orm(c) for c in chests], None, l
                )
            except GetAllItemsException as e:
                raise ChestsException(e.message) from e

    async def get_all_events(self) -> ResponseItemsSchema[EventSchema]:
        async with self.__uow:
            try:
                events = await self.__uow.events.get_all()
                l = check_count_items(events, EVENTS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [EventSchema.from_orm(c) for c in events], None, l
                )
            except GetAllItemsException as e:
                raise EventsException(e.message) from e

    async def get_chest_by_id(self, id: int) -> ChestFullSchema:
        async with self.__uow:
            try:
                chest = await self.__uow.chests.get_by_id_full(id)
                check_exist_items(chest, CHEST_NOT_FOUND)
                return ChestFullSchema.from_orm(chest)
            except GetItemByIdException as e:
                raise ChestsException(e.message) from e

    async def get_event_by_id(self, id: int) -> EventFullSchema:
        async with self.__uow:
            try:
                event = await self.__uow.events.get_by_id_full(id)
                check_exist_items(event, EVENT_NOT_FOUND)
                return EventFullSchema.from_orm(event)
            except GetItemByIdException as e:
                raise EventsException(e.message) from e

    async def post_skin(self, skin: SkinPostSchema):
        async with self.__uow:
            try:
                legend_exist = await self.__uow.legends.get_by_id(skin.legend_id)
                check_exist_items(legend_exist, LEGEND_NOT_FOUND)
                for s_w in skin.weapons:
                    weapon_compares = await self.__uow.weapon_legends.get_one(
                        weapon_id=s_w.weapon_id, legend_id=skin.legend_id
                    )
                    check_exist_items(weapon_compares, WEAPON_NOT_COMPARE)
                weapons_db = [
                    WeaponSkin(weapon_id=w.weapon_id, name=w.name, img=w.img)
                    for w in skin.weapons
                ]
                chests_db = [ChestSkin(chest_id=c.chest_id) for c in skin.chests]
                events_db = [EventSkin(event_id=e.event_id) for e in skin.events]
                skin_db = Skin(
                    legend_id=skin.legend_id,
                    name=skin.name,
                    img=skin.img,
                    is_crossover=skin.is_crossover,
                    is_exclusive=skin.is_exclusive,
                    cost=skin.cost,
                    purshase_info=skin.purshase_info,
                    weapons=weapons_db,
                    chests=chests_db,
                    events=events_db,
                )
                await self.__uow.skins.add(skin_db)
                await self.__uow.commit()
                return MessageSchema(message=SKIN_ADD_SUCCESS)
            except UniqueViolationException as e:
                raise SkinsException(message=SKIN_ADD_FAILED) from e
            except ForeignKeyViolationException as e:
                raise SkinsException(message=SKIN_ADD_FAILED) from e
            except AddItemException as e:
                raise SkinsException(message=SKIN_ADD_FAILED) from e

    async def put_skin(self, skin: SkinPutSchema):
        async with self.__uow:
            try:
                skin_db = await self.__uow.skins.get_by_id(skin.id)
                check_exist_items(skin_db, SKIN_NOT_FOUND)
                skin_db.name = skin.name
                skin_db.img = skin.img
                skin_db.is_crossover = skin.is_crossover
                skin_db.is_exclusive = skin.is_exclusive
                skin_db.cost = skin.cost
                skin_db.purshase_info = skin.purshase_info
                if skin.weapons[0].weapon_id == skin.weapons[1].weapon_id:
                    raise SkinsException()
                for w in skin.weapons:
                    w_db = await self.__uow.weapon_skins.get_one(
                        skin_id=skin.id, weapon_id=w.weapon_id
                    )
                    w_db.img = w.img
                    w_db.name = w.name
                chest_skins_db_clear = await self.__uow.chest_skins.get_all(
                    None, None, skin_id=skin.id
                )
                event_skins_db_clear = await self.__uow.event_skins.get_all(
                    None, None, skin_id=skin.id
                )
                for c_s in chest_skins_db_clear:
                    await self.__uow.chest_skins.delete(
                        skin_id=c_s.skin_id, chest_id=c_s.chest_id
                    )
                for e_s in event_skins_db_clear:
                    await self.__uow.event_skins.delete(
                        skin_id=e_s.skin_id, event_id=e_s.event_id
                    )
                for s_c in skin.chests:
                    s_c_db = ChestSkin(chest_id=s_c.chest_id, skin_id=skin.id)
                    await self.__uow.chest_skins.add(s_c_db)
                for s_e in skin.events:
                    s_e_db = EventSkin(event_id=s_e.event_id, skin_id=skin.id)
                    await self.__uow.event_skins.add(s_e_db)
                await self.__uow.commit()
                return MessageSchema(message=SKIN_UPDATE_SUCCESS)
            except UniqueViolationException as e:
                raise SkinsException(message=SKIN_ADD_FAILED) from e
            except ForeignKeyViolationException as e:
                raise SkinsException(message=SKIN_ADD_FAILED) from e
            except UpdateItemException as e:
                raise SkinsException(message=SKIN_ADD_FAILED) from e

    async def delete_skin(self, id: int):
        async with self.__uow:
            try:
                skin_exist = await self.__uow.skins.get_by_id(id)
                check_exist_items(skin_exist, SKIN_NOT_FOUND)
                await self.__uow.skins.delete(id=id)
                await self.__uow.commit()
                return MessageSchema(message=SKIN_DELETE_SUCCESS)
            except DeleteItemException as e:
                raise SkinsException(message=SKIN_DELETE_FAILED) from e

    async def post_event(self, event: EventPostSchema):
        async with self.__uow:
            try:
                event_db = Event(name=event.name)
                await self.__uow.events.add(event_db)
                await self.__uow.commit()
                return MessageSchema(message=EVENT_ADD_SUCCESS)
            except AddItemException as e:
                raise EventsException(message=SKIN_ADD_FAILED) from e

    async def post_chest(self, chest: ChestPostSchema):
        async with self.__uow:
            try:
                chest_db = Chest(name=chest.name, img=chest.img, cost=chest.cost)
                await self.__uow.chests.add(chest_db)
                await self.__uow.commit()
                return MessageSchema(message=CHEST_ADD_SUCCESS)
            except AddItemException as e:
                raise EventsException(message=CHEST_ADD_FAILED) from e

    async def delete_event_skin(self, event_skin: EventSkinDeleteSchema):
        async with self.__uow:
            try:
                event_skin_exist = await self.__uow.event_skins.get_one(
                    skin_id=event_skin.skin_id, event_id=event_skin.event_id
                )
                check_exist_items(event_skin_exist, EVENT_SKIN_NOT_FOUND)
                await self.__uow.event_skins.delete(
                    skin_id=event_skin.skin_id, event_id=event_skin.event_id
                )
                await self._check_and_change_is_exclusive_on_skin(event_skin.skin_id)
                await self.__uow.commit()
                return MessageSchema(message=EVENT_SKIN_DELETE_SUCCESS)
            except DeleteItemException as e:
                raise EventSkinsException(message=EVENT_SKIN_DELETE_FAILED) from e

    async def delete_chest_skin(self, chest_skin: ChestSkinDeleteSchema):
        async with self.__uow:
            try:
                chest_skin_exist = await self.__uow.chest_skins.get_one(
                    skin_id=chest_skin.skin_id, chest_id=chest_skin.chest_id
                )
                check_exist_items(chest_skin_exist, CHEST_SKIN_NOT_FOUND)
                await self.__uow.chest_skins.delete(
                    skin_id=chest_skin.skin_id, chest_id=chest_skin.chest_id
                )
                await self._check_and_change_is_exclusive_on_skin(chest_skin.skin_id)
                await self.__uow.commit()
                return MessageSchema(message=CHEST_SKIN_DELETE_SUCCESS)
            except DeleteItemException as e:
                raise SkinsException(message=CHEST_SKIN_DELETE_FAILED) from e

    async def _check_and_change_is_exclusive_on_skin(self, skin_id: int):
        chest_skin_exist = await self.__uow.chest_skins.get_one(skin_id=skin_id)
        event_skin_exist = await self.__uow.event_skins.get_one(skin_id=skin_id)
        if chest_skin_exist is None and event_skin_exist is None:
            skin_db = await self.__uow.skins.get_by_id(skin_id)
            skin_db.is_exclusive = False
