from fastapi import APIRouter, Depends, Query

from authorization.schemas import ResourceData, TokenItemData
from background_tasks.mail import send_upgrade_to_admin
from schemas.application import ApplicationGetSchema, ApplicationPostSchema
from schemas.like import LikePostDeleteSchema
from schemas.response_items import ResponseItemsSchema
from schemas.review import ReviewGetSchema, ReviewPostSchema, ReviewPutSchema
from schemas.user import UserPutSchema, UserWithRoleFavouritesSchema, UserWithRoleSchema
from user.dependencies import create_user_service
from user.service import UserService
from config import OAuth2Scheme
from authorization.authorization import AuthorizationService
from authorization.dependencies import *
from authorization.constants import *
from const import DEFAULT_LIMIT, ROLE_ID_ADMIN, VALUE_NOT_LESS, DEFAULT_OFFSET


router = APIRouter(prefix="/users", tags=["Users"])


@router.get(
    "/by_id",
    response_model=UserWithRoleFavouritesSchema,
    summary="Get user by id",
)
async def get_user_by_id(
    user_id: int = Query(default=None, description="If need not ours profile"),
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_GET,
        ResourceData(name=RESOURCE_PROFILE),
        TokenItemData(token=token),
    )
    self_or_not_user_id = user_id if user_id is not None else subject_data.id
    return await user_service.get_user_by_id(self_or_not_user_id)


@router.get(
    "/all",
    response_model=ResponseItemsSchema[UserWithRoleSchema],
    summary="Get all users",
)
async def get_all_users(
    limit: int = Query(
        default=DEFAULT_LIMIT,
        ge=VALUE_NOT_LESS,
        le=DEFAULT_LIMIT,
        description="Count users",
    ),
    offset: int = Query(
        default=DEFAULT_OFFSET, ge=VALUE_NOT_LESS, description="Offset"
    ),
    substr: str = Query(default=None, description="Substr of user's nickname"),
    role_id: int = Query(default=None, description="User role"),
    user_service: UserService = Depends(create_user_service),
):
    return await user_service.get_all_users(limit, offset, substr, role_id)


@router.get(
    "/application",
    response_model=ResponseItemsSchema[ApplicationGetSchema],
    summary="Get all applications if you admin or user's application",
)
async def get_applications(
    limit: int = Query(
        default=DEFAULT_LIMIT,
        ge=VALUE_NOT_LESS,
        le=DEFAULT_LIMIT,
        description="Count users",
    ),
    offset: int = Query(
        default=DEFAULT_OFFSET, ge=VALUE_NOT_LESS, description="Offset"
    ),
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_GET, ResourceData(name=RESOURCE_APPLICATION), TokenItemData(token=token)
    )
    return await user_service.get_applications(limit, offset, subject_data)


@router.post("/application", summary="Add application")
async def post_application(
    appl: ApplicationPostSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_APPLICATION), TokenItemData(token=token)
    )
    return await user_service.post_application(subject_data.id, appl)


@router.delete("/application", summary="Delete application")
async def delete_application(
    appl_id: int,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_application_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_DELETE,
        ResourceData(name=RESOURCE_APPLICATION),
        TokenItemData(token=token, id=appl_id),
    )
    return await user_service.delete_application(appl_id)


@router.post(
    "/favourite",
    summary="Add favourite legend in profile (delete all previous)",
)
async def post_favourite(
    legend_ids: list[int],
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_FAVOURITE), TokenItemData(token=token)
    )
    return await user_service.post_favourite(subject_data.id, legend_ids)


@router.get(
    "/reviews",
    response_model=ResponseItemsSchema[ReviewGetSchema],
    summary="Get reviews",
)
async def get_reviews(
    limit: int = Query(
        default=DEFAULT_LIMIT,
        ge=VALUE_NOT_LESS,
        le=DEFAULT_LIMIT,
        description="Count reviews",
    ),
    offset: int = Query(
        default=DEFAULT_OFFSET, ge=VALUE_NOT_LESS, description="Offset"
    ),
    legend_id: int = Query(default=None, description="Legend id"),
    user_id: int = Query(default=None, description="User id"),
    type_id: int = Query(default=None, description="Type id"),
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_GET, ResourceData(name=RESOURCE_REVIEW), TokenItemData(token=token)
    )
    return await user_service.get_reviews(
        subject_data.id, limit, offset, legend_id, user_id, type_id
    )


@router.post("/review", summary="Add review (if guide it has no mark)")
async def post_review(
    review: ReviewPostSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD, ResourceData(name=RESOURCE_REVIEW), TokenItemData(token=token)
    )
    return await user_service.post_review(subject_data.id, review)


@router.delete("/review/{id}", summary="Delete review")
async def delete_review(
    id: int,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_review_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_DELETE,
        ResourceData(name=RESOURCE_REVIEW),
        TokenItemData(token=token, id=id),
    )
    return await user_service.delete_review(id)


@router.put("/review", summary="Change review (cannot change type)")
async def put_review(
    review: ReviewPutSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_review_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_UPDATE,
        ResourceData(name=RESOURCE_REVIEW),
        TokenItemData(token=token, id=review.id),
    )
    return await user_service.put_review(review)


@router.delete("/", summary="Delete user")
async def delete_user(
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_DELETE,
        ResourceData(name=RESOURCE_USER),
        TokenItemData(token=token),
    )
    return await user_service.delete_user(subject_data.id)


@router.put(
    "/",
    summary="Change user by user or admin (admin can change role) (password not None if user want to change it)",
)
async def change_user(
    user: UserPutSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_user_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_UPDATE,
        ResourceData(name=RESOURCE_USER),
        TokenItemData(token=token, id=user.id),
    )
    res = await user_service.change_user(subject_data.role_id, user)
    if subject_data.role_id == ROLE_ID_ADMIN:
        send_upgrade_to_admin.delay(user.email, user.nickname)
    return res


@router.post("/like", summary="Add/delete like for review")
async def post_delete_like(
    like: LikePostDeleteSchema,
    token: str = Depends(OAuth2Scheme),
    authorization_service: AuthorizationService = Depends(factory_default_auth),
    user_service: UserService = Depends(create_user_service),
):
    resource_data, subject_data = await authorization_service.check_authorization(
        METHOD_ADD,
        ResourceData(name=RESOURCE_LIKE),
        TokenItemData(token=token),
    )
    return await user_service.post_delete_like(subject_data.id, like)


# add appl, delete appl, add favour, delete favour, add like, delete like,
# add review, delete review, change review (чтобы тип нельзя было менять)
# make admin
# delete user, change user
# get reviews by legend id or user id and type id
