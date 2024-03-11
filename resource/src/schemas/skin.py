from pydantic import BaseModel, Field
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.skin import Skin
from schemas.chest import ChestSchema
from schemas.chest_skin import ChestSkinWithChestSchema, ChestSkinSchema
from schemas.event import EventSchema
from schemas.event_skin import EventSkinSchema, EventSkinWithEventSchema


class SkinSchema(sqlalchemy_to_pydantic(Skin)):
    cost: int | None = None

    class Config:
        from_attributes = True


class SkinLegendFullSchema(SkinSchema):
    chests: List[ChestSkinWithChestSchema] = []
    events: List[EventSkinWithEventSchema] = []


class EventSkinWithSkinSchema(EventSkinSchema):
    skin: SkinSchema | None = None


class ChestSkinWithSkinSchema(ChestSkinSchema):
    skin: SkinSchema | None = None


class ChestFullSchema(ChestSchema):
    skins: List[ChestSkinWithSkinSchema] = []


class EventFullSchema(EventSchema):
    skins: List[EventSkinWithSkinSchema] = []
