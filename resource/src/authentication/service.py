import secrets
from fastapi.security import HTTPAuthorizationCredentials, OAuth2PasswordRequestForm
from fastapi import status
from pydantic import ValidationError
from passlib.context import CryptContext
import jwt
from jose import JWTError
from datetime import datetime, timedelta

from authentication.constants import *
from authentication.exceptions import *
from authentication.phrases import *
from authentication.schemas import *
from const import *
from db.exceptions import *
from config import settings
from db.redis_schema import RedisSchema
from exceptions import NotFoundException

from user.phrases import USER_NOT_FOUND
from utils import check_exist_items
from schemas.message import MessageSchema
from services.unit_of_work import IUnitOfWork
from user.exceptions import GetUserByEmailException


class AuthenticationService:
    def __init__(self, uow: IUnitOfWork):
        self.__pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
        self.__uow = uow

    def refresh_token(self, credentials: HTTPAuthorizationCredentials):
        data = self.decode_token(credentials.credentials, REFRESH_TOKEN)
        return self.__generate_tokens(data)

    async def login(self, form_data: OAuth2PasswordRequestForm):
        async with self.__uow:
            try:
                user_db = await self.__check_exist_user(
                    form_data.username, "", self.__uow, False
                )
                if user_db is None:
                    raise InvalidUsernameException() from None
                if not self.__verify_password(form_data.password, user_db.password):
                    raise InvalidPasswordException() from None
                return (
                    self.__generate_tokens(
                        TokenDataSchema.Of(user_db.id, user_db.role_id)
                    ),
                    user_db.email,
                )
            except GetUserByEmailException as e:
                raise LoginException(e.message) from e
            except ValidationError:
                raise IncorrectEmailException()

    async def register(self, user: UserRegisterSchema):
        async with self.__uow:
            try:
                await self.__add_simple_person(user, self.__uow)
                await self.__uow.commit()
                user_db = await self.__check_exist_user(
                    user.email, "", self.__uow, False
                )
                if user_db is None:
                    raise InvalidUsernameException() from None
                return (
                    self.__generate_tokens(
                        TokenDataSchema.Of(user_db.id, user_db.role_id)
                    ),
                    user_db.email,
                )
            except (UniqueViolationException, ForeignKeyViolationException) as e:
                raise RegisterPublicException(
                    e.message, status.HTTP_400_BAD_REQUEST
                ) from e
            except AddItemException as e:
                raise RegisterPublicException(REGISTRATION_FAILED) from e

    async def restore_password(
        self, data: PasswordRestoreSchema, time: int = EXPIRES_PASSWORD_CODE
    ):
        async with self.__uow:
            try:
                await self.__check_exist_user(data.email, "", self.__uow, False)
                key = secrets.token_urlsafe(16)
                record = RedisSchema(key=key, value=data.email, expire=time)
                if await self.__uow.password_recs.add(record):
                    return (MessageSchema(message=URL_SEND_SUCCESS), data.email, key)
                raise IncorrectEmailException(CODE_SEND_FAILED)
            except AddItemException as e:
                raise IncorrectEmailException(CODE_SEND_FAILED) from e
            except Exception as e:
                raise IncorrectEmailException(CODE_SEND_FAILED) from e

    async def change_password(self, data: PasswordChangeSchema):
        async with self.__uow:
            try:
                record = await self.__uow.password_recs.pop(data.code)
                if record:
                    email = record.decode("utf-8")
                    user_db = await self.__check_exist_user(
                        email, "", self.__uow, False
                    )
                    user_db.password = self.__get_password_hash(data.password)
                    await self.__uow.commit()
                    return MessageSchema(message=PASSWORD_CHANGED)
                raise IncorrectEmailException(CODE_INVALID)
            except GetOneItemException as e:
                raise IncorrectEmailException(CODE_INVALID)

    def decode_token(self, token: str, scope: str) -> TokenDataSchema:
        try:
            payload = jwt.decode(
                token, settings.SECRET_STRING, algorithms=[settings.ALGORITHM]
            )
            if payload[PAYLOAD_NAME_SCOPE] == scope:
                user_id = payload.get(PAYLOAD_NAME_SUB_ID)
                role_id = payload.get(PAYLOAD_NAME_SUB_ROLE_ID)
                if user_id and role_id:
                    return TokenDataSchema.Of(user_id, role_id)
                raise InvalidCredentialsException() from None
            raise ScopeTokenInvalidException() from None
        except jwt.ExpiredSignatureError:
            raise TokenExpiredException() from None
        except jwt.InvalidTokenError:
            raise InvalidTokenException() from None
        except (JWTError, ValidationError):
            raise InvalidCredentialsException() from None

    async def __add_simple_person(self, user: UserRegisterSchema, uow: IUnitOfWork):
        await self.__check_exist_user(user.email, user.nickname, uow)
        user.password = self.__get_password_hash(user.password)
        user_db = User(
            email=user.email,
            password=user.password,
            nickname=user.nickname,
            role_id=ROLE_ID_USER,
        )
        await uow.users.add(user_db)

    async def __check_exist_user(
        self, email: str, nickname: str, uow: IUnitOfWork, exist_error: bool = True
    ):
        try:
            user = await uow.users.get_one(email=email)
            nickname = await uow.users.get_one(nickname=nickname)
            if user:
                if exist_error:
                    raise AccountExistExceptionEmail()
                return user
            if nickname:
                if exist_error:
                    raise AccountExistExceptionNickname()
                return user
            elif not exist_error:
                raise InvalidUsernameException()
        except GetUserByEmailException as e:
            raise CheckExistException()

    def __get_password_hash(self, password):
        return self.__pwd_context.hash(password)

    def __verify_password(self, plain_password, hashed_password):
        return self.__pwd_context.verify(plain_password, hashed_password)

    def __generate_tokens(self, data: TokenDataSchema):
        access_payload = self.__constructor_payload(
            data, timedelta(days=0, minutes=ACCESS_TOKEN_EXPIRE_MINUTES), ACCESS_TOKEN
        )
        refresh_payload = self.__constructor_payload(
            data, timedelta(days=REFRESH_TOKEN_EXPIRE_DAYS), REFRESH_TOKEN
        )
        access_token = self.__generate_token(access_payload)
        refresh_token = self.__generate_token(refresh_payload)
        return TokenSchema.Of(access_token, refresh_token)

    def __generate_token(self, payload):
        return jwt.encode(payload, settings.SECRET_STRING, algorithm=settings.ALGORITHM)

    def __constructor_payload(
        self, data: TokenDataSchema, expires: timedelta, scope: str
    ):
        payload = {
            PAYLOAD_NAME_SCOPE: scope,
            PAYLOAD_NAME_SUB_ID: data.id,
            PAYLOAD_NAME_SUB_ROLE_ID: data.role_id,
            PAYLOAD_NAME_EXPIRES: datetime.utcnow() + expires,
            PAYLOAD_NAME_ISSUEDAT: datetime.utcnow(),
        }
        return payload
