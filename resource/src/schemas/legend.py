from pydantic import BaseModel, Field
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.legend import Legend
from schemas.chest_skin import ChestSkinPostSchema
from schemas.event_skin import EventSkinPostSchema
from schemas.legend_stat import (
    LegendStatFullSchema,
    LegendStatSchema,
    LegendStatPostSchema,
)
from schemas.skin import SkinLegendFullSchema
from schemas.weapon_legend import (
    WeaponLegendSchema,
    WeaponLegendPostSchema,
    WeaponLegendDBSchema,
)
from schemas.weapon_skin import WeaponSkinFullSchema, WeaponSkinPostSchema


class LegendSchema(sqlalchemy_to_pydantic(Legend)):
    class Config:
        from_attributes = True


class LegendShortSchema(LegendSchema):
    stats: List[LegendStatSchema] = []
    weapons: List[WeaponLegendSchema] = []


class LegendFullSchema(LegendSchema):
    count_reviews: dict
    stats: List[LegendStatFullSchema] = []
    weapons: List[WeaponLegendSchema] = []
    skins: List[SkinLegendFullSchema] = []


class LegendPostSchema(BaseModel):
    name: str
    aka_name: str
    description: str
    cost: int
    img_main: str
    img_short: str
    release_info: str
    weapons: List[WeaponLegendPostSchema] = Field(..., min_items=2, max_items=2)
    stats: List[LegendStatPostSchema] = Field(..., min_items=4, max_items=4)


class LegendPutSchema(LegendPostSchema):
    id: int


class SkinPostPutBasicSchema(BaseModel):
    name: str
    img: str
    is_crossover: bool
    is_exclusive: bool
    cost: int | None = None
    purshase_info: List[str] = []
    weapons: List[WeaponSkinPostSchema] = Field(..., min_items=2, max_items=2)
    chests: List[ChestSkinPostSchema] = []
    events: List[EventSkinPostSchema] = []


class SkinPostSchema(SkinPostPutBasicSchema):
    legend_id: int


class SkinPutSchema(SkinPostPutBasicSchema):
    id: int


class SkinGetByIdSchema(SkinLegendFullSchema):
    weapons: List[WeaponSkinFullSchema] = []
    legend: LegendSchema | None = None
