from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List
from db.models.event import Event


class EventSchema(sqlalchemy_to_pydantic(Event)):
    class Config:
        from_attributes = True


class EventPostSchema(BaseModel):
    name: str
