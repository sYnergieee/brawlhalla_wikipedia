from fastapi import status

from authentication.phrases import *
from exceptions import ServiceException


class InvalidCredentialsException(ServiceException):
    def __init__(
        self,
        message: str = COULD_NOT_VALIDATE,
        code: int = status.HTTP_401_UNAUTHORIZED,
    ):
        super().__init__(message=message, code=code)


class ScopeTokenInvalidException(ServiceException):
    def __init__(
        self,
        message: str = TOKEN_INVALID_SCOPE,
        code: int = status.HTTP_401_UNAUTHORIZED,
    ):
        super().__init__(message=message, code=code)


class AccountExistExceptionEmail(ServiceException):
    def __init__(
        self,
        message: str = EMAIL_ALREADY_EXIST,
        code: int = status.HTTP_400_BAD_REQUEST,
    ):
        super().__init__(message=message, code=code)
class AccountExistExceptionNickname(ServiceException):
    def __init__(
        self,
        message: str = NICKNAME_ALREADY_EXIST,
        code: int = status.HTTP_400_BAD_REQUEST,
    ):
        super().__init__(message=message, code=code)

class TokenExpiredException(ServiceException):
    def __init__(
        self,
        message: str = TOKEN_EXPIRED,
        code: int = status.HTTP_401_UNAUTHORIZED,
    ):
        super().__init__(message=message, code=code)


class InvalidTokenException(ServiceException):
    def __init__(
        self,
        message: str = TOKEN_INVALID,
        code: int = status.HTTP_401_UNAUTHORIZED,
    ):
        super().__init__(message=message, code=code)


class IncorrectEmailException(ServiceException):
    def __init__(
        self,
        message: str = INCORRECT_EMAIL,
        code: int = status.HTTP_400_BAD_REQUEST,
    ):
        super().__init__(message=message, code=code)


class LoginException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_401_UNAUTHORIZED):
        super().__init__(message=message, code=code)


class CheckExistException(ServiceException):
    def __init__(
        self,
        message: str = CHECK_EXIST,
        code: int = status.HTTP_404_NOT_FOUND,
    ):
        super().__init__(message=message, code=code)


class RegisterPublicException(ServiceException):
    def __init__(self, message: str, code: int = status.HTTP_400_BAD_REQUEST):
        super().__init__(message=message, code=code)


class InvalidUsernameException(ServiceException):
    def __init__(
        self, message: str = INVALID_USERNAME, code: int = status.HTTP_401_UNAUTHORIZED
    ):
        super().__init__(message=message, code=code)


class InvalidUserIdException(ServiceException):
    def __init__(
        self, message: str = INVALID_ID, code: int = status.HTTP_401_UNAUTHORIZED
    ):
        super().__init__(message=message, code=code)


class InvalidPasswordException(ServiceException):
    def __init__(
        self, message: str = INVALID_PASSWORD, code: int = status.HTTP_401_UNAUTHORIZED
    ):
        super().__init__(message=message, code=code)
