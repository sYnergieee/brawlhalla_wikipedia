from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.weapon_skin import WeaponSkin
from schemas.skin import SkinSchema
from schemas.weapon import WeaponSchema


class WeaponSkinSchema(sqlalchemy_to_pydantic(WeaponSkin)):
    class Config:
        from_attributes = True


class WeaponSkinFullSchema(WeaponSkinSchema):
    weapon: WeaponSchema | None = None


class WeaponSkinGetSchema(WeaponSkinFullSchema):
    skin: SkinSchema | None = None


class WeaponSkinPostSchema(BaseModel):
    weapon_id: int
    name: str
    img: str
