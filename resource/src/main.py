from contextlib import asynccontextmanager
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from fastapi_cache import FastAPICache

from config import SchemaAPI, settings
from exceptions import ServiceException
from utils import handle_service_exception
from legend.router import router as legend_router
from skin.router import router as skin_router
from authentication.router import router as authentication_router
from file_operator.router import router as file_router
from user.router import router as user_router
from ws.router import router as ws_router
from fastapi.openapi.utils import get_openapi


@asynccontextmanager
async def lifespan(app: FastAPI):
    SchemaAPI(
        get_openapi(
            title="Resource Brawlhalla Wiki", version="0.1.0", routes=app.routes
        )
    )
    print("Запуск...")
    yield
    FastAPICache.reset()


app = FastAPI(title="Resource Brawlhalla Wiki", version="0.1.0", lifespan=lifespan)
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_URL,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.add_exception_handler(ServiceException, handle_service_exception)

app.include_router(authentication_router)
app.include_router(user_router)
app.include_router(legend_router)
app.include_router(skin_router)
app.include_router(file_router)
app.include_router(ws_router)
