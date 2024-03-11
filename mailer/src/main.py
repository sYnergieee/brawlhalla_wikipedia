from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi_mail import FastMail, MessageSchema, MessageType
from jinja2 import Template
from pydantic import EmailStr
from config import conf, settings
from const import *


app = FastAPI()


@app.get("/greeting/")
async def root(email: EmailStr, name: str):
    html = open(PATH_TEMPLATE, encoding="utf-8").read()
    template = Template(html)
    message = MessageSchema(
        subject=EMAIL_SUBJECT,
        recipients=[email],
        body=template.render(
            title_message="Добро пожаловать!",
            nickname=name,
            message="Рады видеть вас на сайте, располагайтесь.",
            frontend_url=settings.FRONTEND_URL,
        ),
        subtype=MessageType.html,
    )

    fm = FastMail(conf)
    await fm.send_message(message)
    return JSONResponse(status_code=200, content={"message": "email has been sent"})


@app.get("/upgrade/")
async def root(email: EmailStr, name: str):
    html = open(PATH_TEMPLATE, encoding="utf-8").read()
    template = Template(html)
    message = MessageSchema(
        subject=EMAIL_SUBJECT,
        recipients=[email],
        body=template.render(
            title_message="Уведомление!",
            nickname=name,
            message="Вы были повышены до администратора.",
            frontend_url=settings.FRONTEND_URL,
        ),
        subtype=MessageType.html,
    )

    fm = FastMail(conf)
    await fm.send_message(message)
    return JSONResponse(status_code=200, content={"message": "email has been sent"})


@app.get("/change_password/")
async def root(email: EmailStr, code: str):
    html = open(PATH_TEMPLATE, encoding="utf-8").read()
    template = Template(html)
    message = MessageSchema(
        subject=EMAIL_SUBJECT,
        recipients=[email],
        body=template.render(
            title_message="Уведомление!",
            message="""Только что вы запросили запрос на восстановление пароля, если это не вы,не переходите по ссылке! <br>
            <strong>Ссылка станет недействительной через 10 минут!</strong>""",
            recovery_url=settings.RECOVERY_URL,
            code=code,
        ),
        subtype=MessageType.html,
    )

    fm = FastMail(conf)
    await fm.send_message(message)
    return JSONResponse(status_code=200, content={"message": "email has been sent"})
