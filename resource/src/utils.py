from fastapi import HTTPException, Request
from fastapi.responses import JSONResponse
from exceptions import NotFoundException, ServiceException


class IncrementorId:
    def __init__(self):
        self.current_value = 0

    def get_value(self):
        self.current_value += 1
        return self.current_value


def check_count_items(items, phrase: str):
    l = len(items)
    if l == 0:
        raise NotFoundException(phrase)
    return l


def check_exist_items(item, phrase: str):
    if item is None:
        raise NotFoundException(phrase)


def handle_service_exception(request: Request, exc: ServiceException):
    return JSONResponse(content={"detail": exc.message}, status_code=exc.code)
