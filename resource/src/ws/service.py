from fastapi import WebSocket


class WebsocketConnectionService:
    def __init__(self):
        self.__active_connections = {}

    async def connect(self, websocket: WebSocket, user_id: int):
        await websocket.accept()
        self.__active_connections.setdefault(user_id, websocket)

    def disconnect(self, user_id: int):
        if user_id in self.__active_connections:
            user_con = self.__active_connections.pop(user_id)
            user_con.close()

    async def send_personal_message(self, message: dict, user_id: int):
        if user_id in self.__active_connections:
            await self.__active_connections[user_id].send_json(message)

    async def broadcast(self, message: dict):
        for con in self.__active_connections.values():
            await con.send_json(message)