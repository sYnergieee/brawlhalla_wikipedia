from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.weapon import Weapon


class WeaponSchema(sqlalchemy_to_pydantic(Weapon)):
    class Config:
        from_attributes = True


class WeaponPostSchema(BaseModel):
    name: str
    img: str