from pydantic import BaseModel, Field
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List
from datetime import datetime

from db.models.review import Review
from schemas.legend import LegendSchema
from schemas.user import UserSchema


class ReviewSchema(sqlalchemy_to_pydantic(Review)):
    class Config:
        from_attributes = True


class ReviewBasicSchema(BaseModel):
    text: str | None = None
    mark: int | None = Field(default=None, ge=1, le=5)


class ReviewPostSchema(ReviewBasicSchema):
    legend_id: int
    type_id: int


class ReviewPutSchema(ReviewBasicSchema):
    id: int


class ReviewGetSchema(ReviewSchema):
    text: str | None = None
    mark: int | None = None
    change_date: datetime | None = None

    count_likes: int
    is_like: bool = False

    legend: LegendSchema | None = None
    user: UserSchema | None = None
