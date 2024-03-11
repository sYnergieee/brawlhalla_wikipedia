from typing import List
from celery import Celery
from pydantic_settings import BaseSettings
from fastapi.security import OAuth2PasswordBearer
from const import *
from authentication.constants import *
from redis import Redis, asyncio as aioredis

from ws.service import WebsocketConnectionService


class Settings(BaseSettings):
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str
    POSTGRES_DB: str
    POSTGRES_HOST: str
    POSTGRES_PORT: str
    CORS_URL: List[str]

    SECRET_STRING: str
    ALGORITHM: str

    URL_MAILER: str

    REDIS_HOST: str
    REDIS_PORT: str

    FILE_SHARING_URL: str

    class Config:
        env_file = ".env"


settings = Settings()

OAuth2Scheme = OAuth2PasswordBearer(tokenUrl=f"{AUTH}{PATH_SIGNIN}")

REDIS_URL = f"redis://{settings.REDIS_HOST}:{settings.REDIS_PORT}"
RedisConnection = aioredis.from_url(REDIS_URL, encoding="utf8")
celery = Celery(NAME_CELERY, broker=REDIS_URL)


class OpenAPISchemaStore:
    def __init__(self):
        self.schema = {}

    def __call__(self, schema):
        self.schema = schema


SchemaAPI = OpenAPISchemaStore()
WebSocketConnection = WebsocketConnectionService()
