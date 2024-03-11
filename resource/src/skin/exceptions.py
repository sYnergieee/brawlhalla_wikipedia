from fastapi import status

from exceptions import ServiceException


class ChestsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class EventsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class SkinsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class ChestSkinsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class EventSkinsException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)
