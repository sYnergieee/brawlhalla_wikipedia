import requests
from phrases import SEND_FAILED

from config import celery, settings


class MailService:
    def send(self, path: str, **kwargs):
        try:
            result = requests.get(f"{settings.URL_MAILER}/{path}", kwargs)
            if result.status_code != 200:
                print(SEND_FAILED)
            else:
                print(result.text)
            return result
        except Exception as e:
            print(e)


mailer = MailService()


@celery.task
def send_greeting(email: str, name: str):
    mailer.send("greeting", email=email, name=name)


@celery.task
def send_upgrade_to_admin(email: str, name: str):
    mailer.send("upgrade", email=email, name=name)


@celery.task
def send_change_password(email: str, code: str):
    mailer.send("change_password", email=email, code=code)
