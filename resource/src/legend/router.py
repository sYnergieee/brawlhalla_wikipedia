from fastapi import APIRouter, Depends, Query
from authorization.authorization import AuthorizationService
from authorization.schemas import ResourceData, TokenItemData
from config import OAuth2Scheme

from schemas.legend import (
    LegendFullSchema,
    LegendPostSchema,
    LegendShortSchema,
    LegendSchema,
    LegendPutSchema,
)
from schemas.response_items import ResponseItemsSchema
from schemas.stat import StatSchema
from legend.service import LegendService
from legend.dependencies import create_legend_service
from const import DEFAULT_LIMIT, VALUE_NOT_LESS, DEFAULT_OFFSET
from schemas.weapon import WeaponPostSchema, WeaponSchema
from schemas.weapon_skin import WeaponSkinGetSchema
from authorization.dependencies import factory_default_auth
from authorization.constants import *


router = APIRouter(prefix="/legends", tags=["Legends"])


@router.get(
    "/all",
    response_model=ResponseItemsSchema[LegendSchema],
    summary="Get all legends (short)",
)
async def get_all_legends(
    legend_service: LegendService = Depends(create_legend_service),
):
    return await legend_service.get_all_legends()


@router.get(
    "/all_full",
    response_model=ResponseItemsSchema[LegendShortSchema],
    summary="Get all legends",
)
async def get_all_full_legends(
    substr: str = Query(default=None, description="Substr of legend's name"),
    weapon_ids: list[int] = Query(default=None, description="Weapon ids"),
    cost: int = Query(default=None, description="Heroe's cost"),
    strength: int = Query(default=None, description="Strength >"),
    dexterity: int = Query(default=None, description="Dexterity >"),
    defense: int = Query(default=None, description="Armor >"),
    speed: int = Query(default=None, description="Speed >"),
    legend_service: LegendService = Depends(create_legend_service),
):
    return await legend_service.get_all_legends_full(
        substr,
        weapon_ids,
        cost,
        strength,
        dexterity,
        defense,
        speed,
    )


@router.get(
    "/{id}",
    response_model=LegendFullSchema,
    summary="Get legend by id",
)
async def get_legend_by_id(
    id: int, legend_service: LegendService = Depends(create_legend_service)
):
    return await legend_service.get_legend_by_id(id)


@router.post(
    "/",
    summary="Add legend",
)
async def post_legend(
    legend: LegendPostSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    legend_service: LegendService = Depends(create_legend_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_LEGEND), TokenItemData(token=token)
    )
    return await legend_service.post_legend(legend)


@router.put("/", summary="Change legend")
async def put_legend(
    legend: LegendPutSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    legend_service: LegendService = Depends(create_legend_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_UPDATE,
        ResourceData(id=legend.id, name=RESOURCE_LEGEND),
        TokenItemData(token=token),
    )
    return await legend_service.put_legend(legend)


@router.delete(
    "/{id}",
    summary="Delete legend (if developers want to delete Teros, i create this method)",
)
async def delete_legend(
    id: int,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    legend_service: LegendService = Depends(create_legend_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_DELETE,
        ResourceData(name=RESOURCE_LEGEND),
        TokenItemData(token=token, id=id),
    )
    return await legend_service.delete_legend(subject_data.item_id)


@router.get(
    "/stats/all",
    response_model=ResponseItemsSchema[StatSchema],
    summary="Get all statistics",
)
async def get_all_stats(
    legend_service: LegendService = Depends(create_legend_service),
):
    return await legend_service.get_all_stats()


@router.get(
    "/weapons/all",
    response_model=ResponseItemsSchema[WeaponSchema],
    summary="Get all weapons",
)
async def get_all_weapons(
    legend_service: LegendService = Depends(create_legend_service),
):
    return await legend_service.get_all_weapons()


@router.post("/weapon", summary="Add weapon")
async def post_weapon(
    weapon: WeaponPostSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    legend_service: LegendService = Depends(create_legend_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_WEAPON), TokenItemData(token=token)
    )
    return await legend_service.post_weapon(weapon)


@router.get(
    "/weapon_skins/all",
    response_model=ResponseItemsSchema[WeaponSkinGetSchema],
    summary="Get all weapon skins",
)
async def get_all_weapon_skins(
    limit: int = Query(
        default=DEFAULT_LIMIT,
        ge=VALUE_NOT_LESS,
        le=DEFAULT_LIMIT,
        description="Count legends",
    ),
    offset: int = Query(
        default=DEFAULT_OFFSET, ge=VALUE_NOT_LESS, description="Offset"
    ),
    substr: str = Query(default=None, description="Substr of weapon skin's name"),
    weapon_type_ids: list[int] = Query(
        default=None, description="Weapon type ids (filter 'or')"
    ),
    legend_id: int = Query(default=None, description="Legend id"),
    event_ids: list[int] = Query(
        default=None, description="Event ids (filter or) union with chest"
    ),
    chest_ids: list[int] = Query(
        default=None, description="Chest ids (filter or) union with event"
    ),
    legend_service: LegendService = Depends(create_legend_service),
):
    return await legend_service.get_all_weapon_skins(
        limit, offset, substr, weapon_type_ids, legend_id, event_ids, chest_ids
    )
