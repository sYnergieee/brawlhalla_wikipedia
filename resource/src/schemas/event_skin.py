from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List
from db.models.event_skin import EventSkin
from schemas.event import EventSchema


class EventSkinSchema(sqlalchemy_to_pydantic(EventSkin)):
    class Config:
        from_attributes = True


class EventSkinWithEventSchema(EventSkinSchema):
    event: EventSchema | None = None


class EventSkinPostSchema(BaseModel):
    event_id: int


class EventSkinDeleteSchema(EventSkinPostSchema):
    skin_id: int
