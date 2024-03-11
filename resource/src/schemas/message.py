from pydantic import BaseModel
from fastapi import status


class MessageSchema(BaseModel):
    message: str
