from abc import ABC
from typing import Generic, Optional, Type, TypeVar
from redis import Redis

from db.exceptions import AddItemException
from db.repositories.generic import GenericRepository
from db.redis_schema import RedisSchema

T = TypeVar("T")


class GenericRedisRepository(GenericRepository[RedisSchema], Generic[T], ABC):
    def __init__(self, redis_connect: Redis, model_cls: Type[T]) -> None:
        self._redis_connect = redis_connect
        self._model_cls = model_cls

    async def get_all(self, offset: int, limit: int, **filters):
        raise NotImplementedError()

    async def get_one(self, **filters):
        raise NotImplementedError()

    async def get_by_id(self, key: str) -> Optional[T]:
        return await self._redis_connect.get(key)

    async def add(self, record: RedisSchema) -> bool:
        try:
            return await self._redis_connect.set(
                record.key, record.value, record.expire
            )
        except Exception as e:
            raise AddItemException()

    async def delete(self, key: str) -> None:
        return await self._redis_connect.delete(key)
