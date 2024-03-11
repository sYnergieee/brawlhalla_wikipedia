from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List
from db.models.chest import Chest


class ChestSchema(sqlalchemy_to_pydantic(Chest)):
    class Config:
        from_attributes = True


class ChestPostSchema(BaseModel):
    name: str
    img: str
    cost: int
