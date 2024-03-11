from fastapi import APIRouter, Depends, File, Query, UploadFile
from fastapi.responses import RedirectResponse
from authorization.constants import METHOD_ADD

from config import OAuth2Scheme
from const import *
from authorization.dependencies import factory_default_auth
from file_operator.const import RESOURCE_FILE
from file_operator.dependencies import create_file_service
from file_operator.service import FileService
from authorization.authorization import AuthorizationService
from authorization.schemas import ResourceData, TokenItemData

import random, string


router = APIRouter(prefix="/files", tags=["Files"])


@router.get(
    "/{random_string}/{user_id}",
    summary="Get user image",
)
async def get_image_user(
    user_id: int,
    random_string: str,
    file_service: FileService = Depends(create_file_service),
):
    r = await file_service.get_image_user(user_id)
    return RedirectResponse(r)


@router.post("/", summary="Add user image (delete old image)")
async def post_user_image(
    file: UploadFile = File(...),
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    file_service: FileService = Depends(create_file_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_FILE), TokenItemData(token=token)
    )
    return await file_service.post_user_image(subject_data.id, file)
