from background_tasks.mail import (
    send_greeting as send_greeting,
    send_upgrade_to_admin as send_upgrade_to_admin,
    send_change_password as send_change_password
)

from config import celery as celery
