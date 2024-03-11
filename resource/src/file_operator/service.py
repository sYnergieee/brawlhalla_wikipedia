from fastapi import UploadFile, status
import requests
from io import BytesIO
from starlette.responses import StreamingResponse

from config import settings
from db.exceptions import GetItemByIdException
from db.models.file import FileModel
from exceptions import NotFoundException, ServiceException
from file_operator.phrases import *
from schemas.message import MessageSchema
from services.unit_of_work import IUnitOfWork
from user.exceptions import UsersException
from user.phrases import USER_NOT_FOUND
from utils import check_exist_items
from const import *


class FileService:
    def __init__(self, uow: IUnitOfWork):
        self.__uow = uow

    async def get_image_user(self, user_id: int):
        async with self.__uow:
            try:
                user = await self.__uow.users.get_by_id(user_id)
                check_exist_items(user, USER_NOT_FOUND)
                token = await self.__uow.files.get_one(owner_id=user_id)
                if token is None:
                    token = await self.__uow.files.get_image_by_role(user.role_id)
                res = requests.get(f"{settings.FILE_SHARING_URL}/info/{token.token}")
                r = res.json()
                if res.status_code != 200:
                    raise ServiceException(r, status.HTTP_400_BAD_REQUEST)
                result = r.get("downloadUrl", None)
                if result is None:
                    raise NotFoundException(FILE_NOT_FOUND)
                return result
            except NotFoundException as e:
                raise e
            except GetItemByIdException as e:
                raise UsersException(e.message, code=status.HTTP_404_NOT_FOUND) from e
            except Exception as e:
                raise ServiceException(GET_FILE_FAILED, status.HTTP_400_BAD_REQUEST)

    async def post_user_image(self, user_id: int, file: UploadFile):
        async with self.__uow:
            try:
                token_exist = await self.__uow.files.get_one(owner_id=user_id)
                if token_exist is not None:
                    res = requests.post(
                        f"{settings.FILE_SHARING_URL}/delete/{token_exist}/{token_exist.details['deleteToken']}"
                    )
                    if res.status_code != 200:
                        raise ServiceException(
                            DELETE_FILE_FAILED, status.HTTP_400_BAD_REQUEST
                        )
                    await self.__uow.files.delete(token=token_exist.token)
                files = {"file": (file.filename, file.file, file.content_type)}
                res = requests.post(f"{settings.FILE_SHARING_URL}/upload", files=files)
                r = res.json()
                if res.status_code != 200:
                    raise ServiceException(r, status.HTTP_400_BAD_REQUEST)
                token = r["token"]
                f = FileModel(token=token, owner_id=user_id, details=r)
                await self.__uow.files.add(f)
                await self.__uow.commit()
                return MessageSchema(message=ADD_FILE_SUCCESS)
            except Exception as e:
                raise ServiceException(ADD_FILE_FAILED, status.HTTP_400_BAD_REQUEST)
