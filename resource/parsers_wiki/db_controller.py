import json
from db import engine, async_session_maker
import models
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import and_

from models.legend_skin import LegendSkin
from models.skin import Skin


class DatabaseController:
    def __init__(self):
        self.__engine = engine
        self.__sessionLocal = async_session_maker

    # ---------------------------------------------------------------------------------
    # ПРИВАТНЫЕ МЕТОДЫ
    # ---------------------------------------------------------------------------------
    async def _get_weapon_id_by_name(self, session, name):
        stmt = await session.execute(
            select(models.Weapon).where(models.Weapon.name == name)
        )
        return stmt.scalars().one().id

    async def _get_legend_id_by_name(self, session, name):
        stmt = await session.execute(
            select(models.Legend).where(models.Legend.name == name)
        )
        return stmt.scalars().one().id

    async def _get_legend_obj_by_name(self, session, name):
        stmt = await session.execute(
            select(models.Legend).where(models.Legend.name == name)
        )
        return stmt.scalars().one()

    async def _get_stat_id_by_name(self, session, name):
        stmt = await session.execute(
            select(models.Stat).where(models.Stat.name == name)
        )
        return stmt.scalars().one().id

    async def _get_weapon_legend_obj_by_ids(self, session, w_id, l_id):
        stmt = await session.execute(
            select(models.WeaponLegend).where(
                and_(
                    models.WeaponLegend.legend_id == l_id,
                    models.WeaponLegend.weapon_id == w_id,
                )
            )
        )
        return stmt.scalars().one()

    async def _get_chest_id_by_name(self, session, name):
        stmt = await session.execute(
            select(models.Chest).where(models.Chest.name == name)
        )
        res = stmt.scalars().one_or_none()
        return res.id if res is not None else None

    async def _get_event_id_by_name(self, session, name):
        stmt = await session.execute(
            select(models.Event).where(models.Event.name == name)
        )
        res = stmt.scalars().one_or_none()
        return res.id if res is not None else None

    async def _get_skin_id_by_name(self, session, name):
        stmt = await session.execute(
            select(models.Skin).where(models.Skin.name == name)
        )
        return stmt.scalars().one().id

    # ---------------------------------------------------------------------------------
    # МЕТОДЫ С СЕССИЕЙ
    # ---------------------------------------------------------------------------------

    async def GetSession(self):
        return self.__sessionLocal()

    async def CloseSession(self, session):
        await session.close()

    async def AddChestsAll(self, session, chests):
        chests_db = []
        for chest in chests:
            chest_db = models.Chest(
                name=chest["name"], img=chest["img"], cost=chest["cost"]
            )
            chests_db.append(chest_db)
        session.add_all(chests_db)
        await session.commit()

    # ---------------------------------------------------------------------------------
    # ДОБАВЛЕНИЕ В БД
    # ---------------------------------------------------------------------------------
    async def AddLegendFromLegendsJson(self, session, legends):
        legends_db = []
        for legend in legends:
            legend_db = models.Legend(
                name=legend["bio_name"],
                aka_name=legend["bio_aka"],
                description=legend["bio_text"],
            )
            legends_db.append(legend_db)
        session.add_all(legends_db)
        await session.commit()

    async def AddWeaponLegendsFromLegendsJson(self, session, legends):
        weapon_legends_db = []
        for legend in legends:
            w_id1 = await self._get_weapon_id_by_name(session, legend["weapon_one"])
            w_id2 = await self._get_weapon_id_by_name(session, legend["weapon_two"])
            l_id = await self._get_legend_id_by_name(session, legend["bio_name"])
            weapon1_legend_db = models.WeaponLegend(weapon_id=w_id1, legend_id=l_id)
            weapon2_legend_db = models.WeaponLegend(weapon_id=w_id2, legend_id=l_id)
            weapon_legends_db.append(weapon1_legend_db)
            weapon_legends_db.append(weapon2_legend_db)
        session.add_all(weapon_legends_db)
        await session.commit()

    async def AddLegendStatsFromLegendsJson(self, session, legends):
        legend_stats_db = []
        stat_id_str = await self._get_stat_id_by_name(session, "strength")
        stat_id_dex = await self._get_stat_id_by_name(session, "dexterity")
        stat_id_def = await self._get_stat_id_by_name(session, "defense")
        stat_id_speed = await self._get_stat_id_by_name(session, "speed")
        for legend in legends:
            l_id = await self._get_legend_id_by_name(session, legend["bio_name"])
            strength = models.LegendStat(
                stat_id=stat_id_str, legend_id=l_id, value=int(legend["strength"])
            )
            dexterity = models.LegendStat(
                stat_id=stat_id_dex, legend_id=l_id, value=int(legend["dexterity"])
            )
            defense = models.LegendStat(
                stat_id=stat_id_def, legend_id=l_id, value=int(legend["defense"])
            )
            speed = models.LegendStat(
                stat_id=stat_id_speed, legend_id=l_id, value=int(legend["speed"])
            )
            legend_stats_db.append(strength)
            legend_stats_db.append(dexterity)
            legend_stats_db.append(defense)
            legend_stats_db.append(speed)
        session.add_all(legend_stats_db)
        await session.commit()

    async def AddLegendWeaponFromDatabaseJson(self, session, legends):
        for legend in legends:
            legend_db: models.Legend = await self._get_legend_obj_by_name(
                session, legend["name"]
            )
            legend_db.cost = int(legend["cost"].replace(",", ""))
            legend_db.img_main = legend["img_main"]
            legend_db.img_short = legend["img_short"]
            legend_db.release_info = legend["release_info"]
            for weapon in legend["weapon_legends"]:
                weapon_id = await self._get_weapon_id_by_name(session, weapon["type"])
                weapon_legend_db: models.WeaponLegend = (
                    await self._get_weapon_legend_obj_by_ids(
                        session, weapon_id, legend_db.id
                    )
                )
                weapon_legend_db.img = weapon["img"]
                weapon_legend_db.name = weapon["name"]
                await session.commit()
            await session.commit()

    async def AddSkinsFromDatabaseJson(self, session, legends):
        skins_db = []
        for legend in legends:
            for skin in legend["legend_skins"]:
                purshase_info = []
                for ext_info in skin["extra_info"]:
                    if (
                        await self._get_chest_id_by_name(session, ext_info) is None
                        and await self._get_event_id_by_name(session, ext_info) is None
                    ):
                        purshase_info.append(ext_info)
                skin_db = models.Skin(
                    name=skin["name"],
                    img=skin["img"],
                    cost=skin["cost"],
                    is_crossover=skin["is_crossover"],
                    is_exclusive=skin["is_exclusive"],
                    purshase_info=purshase_info,
                )
                skins_db.append(skin_db)
        session.add_all(skins_db)
        await session.commit()

    async def AddInfoSkinsFromDatabaseJson(self, session, legends):
        for legend in legends:
            legend_skins_db = []
            weapon_skins_db = []
            chest_skins_db = []
            event_skins_db = []
            legend_id = await self._get_legend_id_by_name(session, legend["name"])
            for skin in legend["legend_skins"]:
                skin_id = await self._get_skin_id_by_name(session, skin["name"])
                legend_skin_db = models.LegendSkin(
                    legend_id=legend_id,
                    skin_id=skin_id,
                )
                legend_skins_db.append(legend_skin_db)

                for weapon in skin["weapons"]:
                    weapon_skin_db = models.WeaponSkin(
                        weapon_id=await self._get_weapon_id_by_name(
                            session, weapon["type"]
                        ),
                        skin_id=skin_id,
                        img=weapon["img"],
                        name=weapon["name"],
                    )
                    weapon_skins_db.append(weapon_skin_db)
                for ext_i in skin["extra_info"]:
                    chest_id = await self._get_chest_id_by_name(session, ext_i)
                    event_id = await self._get_event_id_by_name(session, ext_i)
                    if chest_id is not None:
                        chest_skin_db = models.ChestSkin(
                            chest_id=chest_id, skin_id=skin_id
                        )
                        chest_skins_db.append(chest_skin_db)
                    if event_id is not None:
                        event_skin_db = models.EventSkin(
                            event_id=event_id, skin_id=skin_id
                        )
                        event_skins_db.append(event_skin_db)
            session.add_all(legend_skins_db)
            session.add_all(weapon_skins_db)
            session.add_all(chest_skins_db)
            session.add_all(event_skins_db)
            await session.commit()

    async def GetTableLegendSkins(self, session):
        stmt = await session.execute(select(LegendSkin))
        query = stmt.scalars().all()
        legend_skins = []
        for q in query:
            legend_skins.append({"legend_id": q.legend_id, "skin_id": q.skin_id})
        with open("legend_skins.json", "w", encoding="utf-8") as file:
            json.dump(legend_skins, file, indent=4, ensure_ascii=False)

    async def AddLegendIdsToNewSkinsModel(self, session, legend_skins):
        for l_s in legend_skins:
            stmt = await session.execute(select(Skin).where(Skin.id == l_s["skin_id"]))
            query = stmt.scalars().one()
            query.legend_id = l_s["legend_id"]
            await session.commit()

    async def ChangeImgCrossoverSkins(self, session, skins):
        for s in skins:
            stmt = await session.execute(select(Skin).where(Skin.name == s["name"]))
            query = stmt.scalars().one_or_none()
            if query:
                query.img = s["img"]
        await session.commit()
