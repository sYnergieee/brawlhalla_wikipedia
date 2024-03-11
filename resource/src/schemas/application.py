from pydantic import BaseModel
from typing import List
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from db.models.application import Application
from schemas.user import UserWithRoleSchema


class ApplicationPostSchema(BaseModel):
    text: str


class ApplicationSchema(sqlalchemy_to_pydantic(Application)):
    class Config:
        from_attributes = True


class ApplicationGetSchema(ApplicationSchema):
    user: UserWithRoleSchema | None = None
