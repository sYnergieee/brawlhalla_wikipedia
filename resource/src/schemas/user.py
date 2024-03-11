from pydantic import BaseModel, EmailStr, Field, SecretStr
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.user import User
from schemas.favourite import FavouriteWithLegendSchema
from schemas.role import RoleSchema


class UserSchema(sqlalchemy_to_pydantic(User)):
    firstname: str | None = None
    lastname: str | None = None
    telegram: str | None = None
    discord: str | None = None

    class Config:
        from_attributes = True


class UserWithRoleSchema(UserSchema):
    password: str | SecretStr = Field(..., exclude=True)
    role: RoleSchema | None = None


class UserWithRoleFavouritesSchema(UserWithRoleSchema):
    favourites: List[FavouriteWithLegendSchema] = []


class UserPutSchema(BaseModel):
    id: int
    nickname: str
    email: EmailStr
    password: str | None = Field(default=None, min_length=5)
    firstname: str | None = None
    lastname: str | None = None
    telegram: str | None = None
    discord: str | None = None
    role_id: int | None = None
