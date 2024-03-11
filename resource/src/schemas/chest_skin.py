from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List
from db.models.chest_skin import ChestSkin
from schemas.chest import ChestSchema


class ChestSkinSchema(sqlalchemy_to_pydantic(ChestSkin)):
    class Config:
        from_attributes = True


class ChestSkinWithChestSchema(ChestSkinSchema):
    chest: ChestSchema | None = None


class ChestSkinPostSchema(BaseModel):
    chest_id: int


class ChestSkinDeleteSchema(ChestSkinPostSchema):
    skin_id: int
