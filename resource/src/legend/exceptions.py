from fastapi import status

from exceptions import ServiceException


class StatsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class LegendsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class WeaponsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)
