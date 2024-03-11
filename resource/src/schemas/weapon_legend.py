from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.weapon_legend import WeaponLegend
from schemas.weapon import WeaponSchema


class WeaponLegendDBSchema(sqlalchemy_to_pydantic(WeaponLegend)):
    img: str | None = None
    name: str | None = None

    class Config:
        from_attributes = True


class WeaponLegendSchema(WeaponLegendDBSchema):
    weapon: WeaponSchema | None = None


class WeaponLegendPostSchema(BaseModel):
    weapon_id: int
    name: str | None = None
    img: str | None = None
