from abc import ABC, abstractmethod
from redis import Redis
from sqlalchemy.ext.asyncio import AsyncSession
from typing import List, Optional
from sqlalchemy.orm import selectinload
from sqlalchemy import and_, select, union_all
from sqlalchemy.sql import union


from db.models import *
from db.repositories.generic_redis import GenericRedisRepository
from db.repositories.generic import GenericRepository
from db.redis_schema import RedisSchema


class IPasswordRecsRepository(GenericRepository[RedisSchema], ABC):
    @abstractmethod
    async def pop(key: str):
        raise NotImplementedError()


class PasswordRecsRepository(
    GenericRedisRepository[RedisSchema], IPasswordRecsRepository
):
    def __init__(self, redis_connect: Redis) -> None:
        super().__init__(redis_connect, RedisSchema)

    async def pop(self, key: str):
        record = await self.get_by_id(key)
        await self.delete(key)
        return record
