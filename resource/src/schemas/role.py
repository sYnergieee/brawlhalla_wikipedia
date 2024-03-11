from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from typing import List

from db.models.role import Role


class RoleSchema(sqlalchemy_to_pydantic(Role)):
    class Config:
        from_attributes = True
