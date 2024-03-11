from fastapi import APIRouter, Depends, Query

from authorization.dependencies import factory_default_auth
from authorization.schemas import ResourceData, TokenItemData
from schemas.chest_skin import ChestSkinDeleteSchema
from schemas.event_skin import EventSkinDeleteSchema, EventSkinPostSchema
from schemas.legend import SkinGetByIdSchema, SkinPostSchema, SkinPutSchema
from schemas.response_items import ResponseItemsSchema
from schemas.skin import ChestFullSchema, EventFullSchema, SkinLegendFullSchema
from skin.dependencies import create_skin_service
from skin.service import SkinService
from const import DEFAULT_LIMIT, VALUE_NOT_LESS, DEFAULT_OFFSET
from schemas.chest import ChestPostSchema, ChestSchema
from schemas.event import EventPostSchema, EventSchema
from authorization.authorization import AuthorizationService
from config import OAuth2Scheme
from authorization.constants import *


router = APIRouter(prefix="/skins", tags=["Skins"])


@router.get(
    "/all",
    response_model=ResponseItemsSchema[SkinLegendFullSchema],
    summary="Get all skins",
)
async def get_all_skins(
    limit: int = Query(
        default=DEFAULT_LIMIT,
        ge=VALUE_NOT_LESS,
        le=DEFAULT_LIMIT,
        description="Count skins",
    ),
    offset: int = Query(
        default=DEFAULT_OFFSET, ge=VALUE_NOT_LESS, description="Offset"
    ),
    substr: str = Query(default=None, description="Substr of skin's name"),
    legend_id: int = Query(default=None, description="Legend id"),
    is_exclusive: bool = Query(default=None, description="Exclusive or not"),
    is_crossover: bool = Query(default=None, description="Crossover or not"),
    event_ids: list[int] = Query(
        default=None, description="Event ids (filter or) union with chest"
    ),
    chest_ids: list[int] = Query(
        default=None, description="Chest ids (filter or) union with event"
    ),
    skin_service: SkinService = Depends(create_skin_service),
):
    return await skin_service.get_all_skins(
        limit,
        offset,
        substr,
        legend_id,
        is_exclusive,
        is_crossover,
        event_ids,
        chest_ids,
    )


@router.get("/{id}", response_model=SkinGetByIdSchema, summary="Get skin by id")
async def get_skin_by_id(
    id: int,
    skin_service: SkinService = Depends(create_skin_service),
):
    return await skin_service.get_skin_by_id(id)


@router.post(
    "/",
    summary="Add skin",
)
async def post_skin(
    skin: SkinPostSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    skin_service: SkinService = Depends(create_skin_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_SKIN), TokenItemData(token=token)
    )
    return await skin_service.post_skin(skin)


@router.put(
    "/",
    summary="Change skin (will clear all events and chests, don't forget to include in your requests the ones you don't want to delete.)",
)
async def put_skin(
    skin: SkinPutSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    skin_service: SkinService = Depends(create_skin_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_UPDATE, ResourceData(id=skin.id, name=RESOURCE_SKIN), TokenItemData(token=token)
    )
    return await skin_service.put_skin(skin)


@router.delete("/{id}", summary="Delete skin")
async def delete_skin(
    id: int,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    skin_service: SkinService = Depends(create_skin_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_DELETE, ResourceData(id=id, name=RESOURCE_SKIN), TokenItemData(token=token)
    )
    return await skin_service.delete_skin(id)


@router.get(
    "/events/all",
    response_model=ResponseItemsSchema[EventSchema],
    summary="Get all events",
)
async def get_all_events(
    skin_service: SkinService = Depends(create_skin_service),
):
    return await skin_service.get_all_events()


@router.get(
    "/event/{id}",
    response_model=EventFullSchema,
    summary="Get event by id",
)
async def get_event_by_id(
    id: int, skin_service: SkinService = Depends(create_skin_service)
):
    return await skin_service.get_event_by_id(id)


@router.post("/event", summary="Add event")
async def post_event(
    event: EventPostSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    skin_service: SkinService = Depends(create_skin_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_EVENT), TokenItemData(token=token)
    )
    return await skin_service.post_event(event)


@router.delete(
    "/event_skin/",
    summary="Delete skin from event (also change is exclusive on skin if it not connected to other event or chest)",
)
async def delete_event_skin(
    event_skin: EventSkinDeleteSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    skin_service: SkinService = Depends(create_skin_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_DELETE, ResourceData(name=RESOURCE_EVENT_SKIN), TokenItemData(token=token)
    )
    return await skin_service.delete_event_skin(event_skin)


@router.get(
    "/chests/all",
    response_model=ResponseItemsSchema[ChestSchema],
    summary="Get all chests",
)
async def get_all_chests(
    skin_service: SkinService = Depends(create_skin_service),
):
    return await skin_service.get_all_chests()


@router.get(
    "/chest/{id}",
    response_model=ChestFullSchema,
    summary="Get chest by id",
)
async def get_chest_by_id(
    id: int, skin_service: SkinService = Depends(create_skin_service)
):
    return await skin_service.get_chest_by_id(id)


@router.post("/chest", summary="Add chest")
async def post_chest(
    chest: ChestPostSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    skin_service: SkinService = Depends(create_skin_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_CHEST), TokenItemData(token=token)
    )
    return await skin_service.post_chest(chest)


@router.delete(
    "/chest_skin/",
    summary="Delete skin from chest (also change is exclusive on skin if it not connected to other event or chest)",
)
async def delete_chest_skin(
    chest_skin: ChestSkinDeleteSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    skin_service: SkinService = Depends(create_skin_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_DELETE, ResourceData(name=RESOURCE_CHEST_SKIN), TokenItemData(token=token)
    )
    return await skin_service.delete_chest_skin(chest_skin)
