import json
from db import Base
from db_controller import DatabaseController
import asyncio


async def parsing_brawlhalla():
    database_controller = DatabaseController()
    session = await database_controller.GetSession()

    # with open("docs\chest_database.json", "r", encoding="utf-8") as file:
    #     chests = json.load(file)
    # await add_chests(chests, database_controller, session)

    # with open("docs\legens.json", "r", encoding="utf-8") as file:
    #     legends = json.load(file)
    # await add_legend_stats_from_legends_json(legends, database_controller, session)

    # with open("docs\database.json", "r", encoding="utf-8") as file:
    #     legends = json.load(file)
    # await add_info_skins_from_database_json(legends, database_controller, session)

    # with open("docs\legend_skins.json", "r", encoding="utf-8") as file:
    #     legend_skins = json.load(file)
    # await add_legend_ids_to_new_skins_model(legend_skins, database_controller, session)

    with open("docs\dont_work_skins_database.json", "r", encoding="utf-8") as file:
        skins = json.load(file)
    await change_image_crossover_skins(skins, database_controller, session)

    await database_controller.CloseSession(session)


async def add_chests(chests: list, database_controller: DatabaseController, session):
    await database_controller.AddChestsAll(session, chests)


async def add_legends_from_legends_json(
    legends: list, database_controller: DatabaseController, session
):
    await database_controller.AddLegendFromLegendsJson(session, legends["data"])


async def add_weapon_legends_from_legends_json(
    legends: list, database_controller: DatabaseController, session
):
    await database_controller.AddWeaponLegendsFromLegendsJson(session, legends["data"])


async def add_legend_stats_from_legends_json(
    legends: list, database_controller: DatabaseController, session
):
    await database_controller.AddLegendStatsFromLegendsJson(session, legends["data"])


async def add_legend_weapon_from_database_json(
    legends: list, database_controller: DatabaseController, session
):
    await database_controller.AddLegendWeaponFromDatabaseJson(session, legends)


async def add_skins_from_database_json(
    legends: list, database_controller: DatabaseController, session
):
    await database_controller.AddSkinsFromDatabaseJson(session, legends)


async def add_info_skins_from_database_json(
    legends: list, database_controller: DatabaseController, session
):
    await database_controller.AddInfoSkinsFromDatabaseJson(session, legends)


async def get_table_legend_skins(database_controller: DatabaseController, session):
    await database_controller.GetTableLegendSkins(session)


async def add_legend_ids_to_new_skins_model(
    legend_skins: list, database_controller: DatabaseController, session
):
    await database_controller.AddLegendIdsToNewSkinsModel(session, legend_skins)


async def change_image_crossover_skins(
    skins: list, database_controller: DatabaseController, session
):
    await database_controller.ChangeImgCrossoverSkins(session, skins)


async def main():
    await parsing_brawlhalla()
    print("Асинхронная функция main выполнена")


asyncio.run(main())
