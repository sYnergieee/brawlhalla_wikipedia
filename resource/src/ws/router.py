from fastapi import (
    APIRouter,
    Depends,
    Query,
    Request,
    WebSocket,
    WebSocketDisconnect,
    Header,
)

from authentication.constants import ACCESS_TOKEN
from authentication.service import AuthenticationService
from authorization.authorization import AuthorizationService
from authorization.schemas import ResourceData
from const import *
from config import OAuth2Scheme, WebSocketConnection
from exceptions import ServiceException
from authentication.dependencies import create_authentication_service

router = APIRouter(tags=["WS"], prefix="/websocket")


@router.get("/test_ws")
async def sdadas():
    await WebSocketConnection.send_personal_message({"message": "Hello"}, 5)


@router.websocket("/ws")
async def websocket_endpoint(
    websocket: WebSocket,
    is_broadcast: bool = False,
    friend_id: int | None = None,
    Authorization: str = Header(),
    auth_service: AuthenticationService = Depends(create_authentication_service),
):
    try:
        token_data = auth_service.decode_token(Authorization, ACCESS_TOKEN)
    except ServiceException as e:
        return {"code": e.code, "message": e.message}
    if token_data.id:
        await WebSocketConnection.connect(websocket, token_data.id)
        await WebSocketConnection.send_personal_message(
            {"message": "Hello"}, token_data.id
        )
        if is_broadcast:
            try:
                while True:
                    data = await websocket.receive_json()
                    await WebSocketConnection.broadcast(
                        {"message": "message for all users"}
                    )
            except WebSocketDisconnect:
                WebSocketConnection.disconnect(token_data.id)
        elif friend_id:
            try:
                while True:
                    data = await websocket.receive_json()
                    await WebSocketConnection.send_personal_message(data, friend_id)
            except WebSocketDisconnect:
                WebSocketConnection.disconnect(token_data.id)
        else:
            try:
                while True:
                    data = await websocket.receive_json()
                    await WebSocketConnection.send_personal_message(data, token_data.id)
            except WebSocketDisconnect:
                WebSocketConnection.disconnect(token_data.id)
