from enum import Enum
from pydantic import BaseModel, Field
from datetime import datetime
from datetime import date


class SubjectData(BaseModel):
    id: int
    role_id: int
    owner_id: int | None = None
    item_id: int | None = None


class ResourceData(BaseModel):
    name: str


class ActionData(BaseModel):
    name: str


class TokenItemData(BaseModel):
    token: str
    id: int | None = None


class StatusAccess(Enum):
    allow = True
    denied = False
