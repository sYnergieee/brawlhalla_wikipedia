from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.favourite import Favourite
from schemas.legend import LegendSchema


class FavouriteSchema(sqlalchemy_to_pydantic(Favourite)):
    class Config:
        from_attributes = True


class FavouriteWithLegendSchema(FavouriteSchema):
    legend: LegendSchema | None = None
