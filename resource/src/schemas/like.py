from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List


class LikePostDeleteSchema(BaseModel):
    review_id: int
