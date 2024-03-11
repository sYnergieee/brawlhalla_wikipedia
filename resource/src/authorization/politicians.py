import vakt
from vakt.rules import Eq, Truthy, Any

from authorization.constants import *
from file_operator.const import RESOURCE_FILE
from utils import IncrementorId
from const import *

Incrementor = IncrementorId()

politicians = [
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_GET)],
        resources=[Eq(RESOURCE_PROFILE), Eq(RESOURCE_APPLICATION), Eq(RESOURCE_REVIEW)],
        subjects=[Any()],
        effect=vakt.ALLOW_ACCESS,
        description="Everyone can view the user's profile and applications, reviews",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_ADD)],
        resources=[Eq(RESOURCE_FAVOURITE), Eq(RESOURCE_REVIEW), Eq(RESOURCE_LIKE), Eq(RESOURCE_FILE)],
        subjects=[Any()],
        effect=vakt.ALLOW_ACCESS,
        description="Everyone can add favourite, review, like, file",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_DELETE)],
        resources=[Eq(RESOURCE_APPLICATION), Eq(RESOURCE_REVIEW)],
        subjects=[
            {"role": Eq(ROLE_ID_ADMIN)},
            {"role": Eq(ROLE_ID_USER), "is_owner": Truthy()},
        ],
        effect=vakt.ALLOW_ACCESS,
        description="Users can delete his applications, reviews, Admin can delete all user's applications, reviews",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_UPDATE)],
        resources=[Eq(RESOURCE_REVIEW), Eq(RESOURCE_USER)],
        subjects=[
            {"role": Eq(ROLE_ID_ADMIN)},
            {"role": Eq(ROLE_ID_USER), "is_owner": Truthy()},
        ],
        effect=vakt.ALLOW_ACCESS,
        description="Users can update his reviews, profiles, Admin can update all user's reviews, profiles",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_DELETE)],
        resources=[Eq(RESOURCE_USER)],
        subjects=[
            {"role": Eq(ROLE_ID_ADMIN)},
            {"role": Eq(ROLE_ID_USER)},
        ],
        effect=vakt.ALLOW_ACCESS,
        description="Admins and users can delete them profile by token",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_ADD)],
        resources=[
            Eq(RESOURCE_WEAPON),
            Eq(RESOURCE_LEGEND),
            Eq(RESOURCE_SKIN),
            Eq(RESOURCE_EVENT),
            Eq(RESOURCE_CHEST),
        ],
        subjects=[{"role": Eq(ROLE_ID_ADMIN)}],
        effect=vakt.ALLOW_ACCESS,
        description="Only admins can add weapon, legend, skin, event",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_ADD)],
        resources=[
            Eq(RESOURCE_APPLICATION),
        ],
        subjects=[{"role": Eq(ROLE_ID_USER)}],
        effect=vakt.ALLOW_ACCESS,
        description="Only users can add applications",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_DELETE)],
        resources=[
            Eq(RESOURCE_LEGEND),
            Eq(RESOURCE_SKIN),
            Eq(RESOURCE_EVENT_SKIN),
            Eq(RESOURCE_CHEST_SKIN),
        ],
        subjects=[{"role": Eq(ROLE_ID_ADMIN)}],
        effect=vakt.ALLOW_ACCESS,
        description="Only admins can delete legend, skin, event skin, chest skin",
    ),
    vakt.Policy(
        Incrementor.get_value(),
        actions=[Eq(METHOD_UPDATE)],
        resources=[Eq(RESOURCE_LEGEND), Eq(RESOURCE_SKIN)],
        subjects=[{"role": Eq(ROLE_ID_ADMIN)}],
        effect=vakt.ALLOW_ACCESS,
        description="Only admins can update legend, skin",
    ),
]
