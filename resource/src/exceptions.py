from fastapi import status


class ServiceException(Exception):
    def __init__(self, message: str, code: int):
        self.message = message
        self.code = code


class NotFoundException(ServiceException):
    def __init__(self, message: str):
        super().__init__(message, status.HTTP_200_OK)


class BadRequest(ServiceException):
    def __init__(self, message: str):
        super().__init__(message, status.HTTP_400_BAD_REQUEST)
