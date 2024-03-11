from fastapi import status

from db.exceptions import DBException
from exceptions import ServiceException


class GetUserByEmailException(DBException):
    """Ошибка получения пользователя по email"""

    def __init__(self, email: str):
        super().__init__(f"Не удалось получить пользователя по email {email}")


class GetAvailableRolesException(DBException):
    """Ошибка получения доступных ролей"""

    def __init__(self, email: str):
        super().__init__(f"Не удалось получить доступные роли")


class UsersException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class ApplicationsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class FavouritesException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class ReviewsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class LikesException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)
