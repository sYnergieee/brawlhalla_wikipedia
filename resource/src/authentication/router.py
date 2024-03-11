from fastapi import APIRouter, Depends, Security
from fastapi.security import (
    HTTPAuthorizationCredentials,
    HTTPBearer,
    OAuth2PasswordRequestForm,
)

from authentication.constants import *
from authentication.dependencies import create_authentication_service
from authentication.schemas import *
from authentication.service import AuthenticationService
from background_tasks.mail import send_change_password, send_greeting
from schemas.message import MessageSchema

router = APIRouter(prefix=f"/{AUTH}", tags=["Auth"])
security = HTTPBearer()


@router.post(
    PATH_SIGNIN,
    response_model=TokenSchema,
    summary="Authentication",
)
async def login_for_access_token(
    form_data: OAuth2PasswordRequestForm = Depends(),
    authentication_service: AuthenticationService = Depends(
        create_authentication_service
    ),
):
    token, email = await authentication_service.login(form_data)
    return token


@router.post(
    "/refresh_token",
    response_model=TokenSchema,
    summary="Refresh tokens",
)
async def refresh_access_token(
    credentials: HTTPAuthorizationCredentials = Security(security),
    authentication_service: AuthenticationService = Depends(
        create_authentication_service
    ),
):
    return authentication_service.refresh_token(credentials)


@router.post(
    "/signup",
    summary="Registration",
    response_model=TokenSchema,
)
async def register(
    user: UserRegisterSchema,
    authentication_service: AuthenticationService = Depends(
        create_authentication_service
    ),
):
    token, email = await authentication_service.register(user)
    send_greeting.delay(email, user.nickname)
    return token


@router.post("/password/restore", summary="Restore password")
async def restore_password(
    data: PasswordRestoreSchema,
    authentication_service: AuthenticationService = Depends(
        create_authentication_service
    ),
):
    message, email, code = await authentication_service.restore_password(data)
    send_change_password.delay(email, code)
    return message


@router.post("/password/change", summary="Change password with code")
async def change_password(
    data: PasswordChangeSchema,
    authentication_service: AuthenticationService = Depends(
        create_authentication_service
    ),
):
    return await authentication_service.change_password(data)
