from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.stat_img import StatImg


class StatImgSchema(sqlalchemy_to_pydantic(StatImg)):
    class Config:
        from_attributes = True
