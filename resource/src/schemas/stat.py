from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.stat import Stat


class StatSchema(sqlalchemy_to_pydantic(Stat)):
    class Config:
        from_attributes = True