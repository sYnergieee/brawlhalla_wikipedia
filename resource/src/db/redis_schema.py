from typing import Any
from pydantic import BaseModel


class RedisSchema(BaseModel):
    key: str
    value: Any
    expire: int = 0
