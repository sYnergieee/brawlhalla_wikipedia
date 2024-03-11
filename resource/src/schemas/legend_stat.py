from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.legend_stat import LegendStat
from schemas.stat import StatSchema
from schemas.stat_img import StatImgSchema


class LegendStatSchema(sqlalchemy_to_pydantic(LegendStat)):
    stat: StatSchema | None = None

    class Config:
        from_attributes = True


class LegendStatFullSchema(LegendStatSchema):
    stat_img: StatImgSchema | None = None


class LegendStatPostSchema(BaseModel):
    stat_id: int
    value: int