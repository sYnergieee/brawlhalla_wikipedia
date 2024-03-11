from pydantic_settings import BaseSettings
from fastapi_mail import ConnectionConfig


class Settings(BaseSettings):
    MAIL_USERNAME: str
    MAIL_PASSWORD: str
    MAIL_PORT: str
    MAIL_SERVER: str
    MAIL_FROM: str
    MAIL_FROM_NAME: str
    FRONTEND_URL: str
    RECOVERY_URL: str

    class Config:
        env_file = ".env"


settings = Settings()


conf = ConnectionConfig(
    MAIL_USERNAME=settings.MAIL_USERNAME,
    MAIL_PASSWORD=settings.MAIL_PASSWORD,
    MAIL_FROM=settings.MAIL_FROM,
    MAIL_PORT=settings.MAIL_PORT,
    MAIL_SERVER=settings.MAIL_SERVER,
    MAIL_FROM_NAME=settings.MAIL_FROM_NAME,
    MAIL_STARTTLS=False,
    MAIL_SSL_TLS=True,
    USE_CREDENTIALS=True,
    VALIDATE_CERTS=True,
)
