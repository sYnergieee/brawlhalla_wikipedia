from db.db import async_session_maker
from config import RedisConnection
from services.unit_of_work import UnitOfWork


def create_uow():
    return UnitOfWork(async_session_maker, RedisConnection)
