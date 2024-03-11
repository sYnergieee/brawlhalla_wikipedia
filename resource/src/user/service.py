from datetime import datetime
from passlib.context import CryptContext

from authorization.schemas import SubjectData
from db.exceptions import *
from schemas.application import ApplicationPostSchema, ApplicationGetSchema
from schemas.like import LikePostDeleteSchema
from schemas.message import MessageSchema
from schemas.response_items import ResponseItemsSchema
from schemas.review import ReviewGetSchema, ReviewPostSchema, ReviewPutSchema
from schemas.user import UserPutSchema, UserWithRoleFavouritesSchema, UserWithRoleSchema
from services.unit_of_work import IUnitOfWork
from utils import check_count_items, check_exist_items
from user.phrases import *
from user.exceptions import *
from db.models import *
from const import *


class UserService:
    def __init__(self, uow: IUnitOfWork):
        self.__pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
        self.__uow = uow

    async def get_user_by_id(self, user_id: int) -> UserWithRoleFavouritesSchema:
        async with self.__uow:
            try:
                user = await self.__uow.users.get_by_id_full(user_id)
                check_exist_items(user, USER_NOT_FOUND)
                return UserWithRoleFavouritesSchema.from_orm(user)
            except GetItemByIdException as e:
                raise UsersException(e.message) from e

    async def get_all_users(
        self,
        limit: int | None,
        offset: int | None,
        substr: str | None,
        role_id: int | None,
    ) -> ResponseItemsSchema[UserWithRoleSchema]:
        async with self.__uow:
            try:
                users = await self.__uow.users.get_all(limit, offset, substr, role_id)
                l = check_count_items(users, USERS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [UserWithRoleSchema.from_orm(u) for u in users], None, l
                )
            except GetAllItemsException as e:
                raise UsersException(e.message) from e

    async def post_application(self, subject_data: int, appl: ApplicationPostSchema):
        async with self.__uow:
            try:
                appl_db = Application(text=appl.text, default_user_id=subject_data)
                await self.__uow.applications.add(appl_db)
                await self.__uow.commit()
                return MessageSchema(message=APPLICATION_ADD_SUCCESS)
            except ForeignKeyViolationException as e:
                raise ApplicationsException(message=APPLICATION_ADD_FAILED) from e
            except AddItemException as e:
                raise ApplicationsException(message=APPLICATION_ADD_FAILED) from e

    async def get_applications(
        self, limit, offset, subject_data: SubjectData
    ) -> ResponseItemsSchema[ApplicationGetSchema]:
        async with self.__uow:
            try:
                if subject_data.role_id == ROLE_ID_ADMIN:
                    appls = await self.__uow.applications.get_all(offset, limit, None)
                elif subject_data.role_id == ROLE_ID_USER:
                    appls = await self.__uow.applications.get_all(
                        offset, limit, user_id=subject_data.id
                    )
                l = check_count_items(appls, APPLICATIONS_NOT_FOUND)
                return ResponseItemsSchema.Of(
                    [ApplicationGetSchema.from_orm(a) for a in appls], offset, l
                )
            except GetAllItemsException as e:
                raise ApplicationsException(e.message) from e

    async def delete_application(
        self,
        appl_id: int,
    ):
        async with self.__uow:
            try:
                await self.__uow.applications.delete(id=appl_id)
                await self.__uow.commit()
                return MessageSchema(message=APPLICATION_DELETE_SUCCESS)
            except GetItemByIdException as e:
                raise ApplicationsException(message=APPLICATION_DELETE_FAILED) from e
            except DeleteItemException as e:
                raise ApplicationsException(message=APPLICATION_DELETE_FAILED) from e

    async def post_favourite(
        self,
        user_id: int,
        legend_ids: list[int],
    ):
        async with self.__uow:
            try:
                if len(set(legend_ids)) != len(legend_ids):
                    raise FavouritesException(message=FAVOURITES_ADD_FAILED)
                favourites_exist_db = await self.__uow.favourites.get_all(
                    None, None, user_id=user_id
                )
                for f in favourites_exist_db:
                    await self.__uow.favourites.delete(
                        user_id=user_id, legend_id=f.legend_id
                    )
                for l in legend_ids:
                    await self.__uow.favourites.add(
                        Favourite(legend_id=l, user_id=user_id)
                    )
                await self.__uow.commit()
                return MessageSchema(message=FAVOURITES_ADD_SUCCESS)
            except UniqueViolationException as e:
                raise FavouritesException(message=FAVOURITES_ADD_FAILED) from e
            except ForeignKeyViolationException as e:
                raise FavouritesException(message=FAVOURITES_ADD_FAILED) from e
            except AddItemException as e:
                raise FavouritesException(message=FAVOURITES_ADD_FAILED) from e

    async def post_review(self, user_id: int, review: ReviewPostSchema):
        async with self.__uow:
            try:
                if review.type_id == TYPE_GUIDE and (
                    review.mark != None or review.text == None
                ):
                    raise ReviewsException(message=REVIEW_ADD_FAILED)
                if review.type_id == TYPE_REVIEW:
                    review_exist = await self.__uow.reviews.get_one(
                        user_id=user_id, type_id=TYPE_REVIEW, legend_id=review.legend_id
                    )
                    if review_exist is not None:
                        raise ReviewsException(message=REVIEW_ADD_FAILED)
                review_db = Review(
                    text=review.text,
                    mark=review.mark,
                    legend_id=review.legend_id,
                    user_id=user_id,
                    type_id=review.type_id,
                )
                await self.__uow.reviews.add(review_db)
                await self.__uow.commit()
                return MessageSchema(message=REVIEW_ADD_SUCCESS)
            except UniqueViolationException as e:
                raise ReviewsException(message=REVIEW_ADD_FAILED) from e
            except ForeignKeyViolationException as e:
                raise ReviewsException(message=REVIEW_ADD_FAILED) from e
            except AddItemException as e:
                raise ReviewsException(message=REVIEW_ADD_FAILED) from e

    async def get_reviews(
        self,
        self_id: int,
        limit: int | None,
        offset: int | None,
        legend_id: int | None,
        user_id: int | None,
        type_id: int | None,
    ) -> ResponseItemsSchema[ReviewGetSchema]:
        async with self.__uow:
            try:
                reviews = await self.__uow.reviews.get_all_full(
                    limit, offset, legend_id, user_id, type_id
                )
                l = check_count_items(reviews, REVIEWS_NOT_FOUND)
                items = []
                for r in reviews:
                    item = ReviewGetSchema.from_orm(r)
                    is_like = await self.__uow.likes.get_one(
                        review_id=r.id, user_id=self_id
                    )
                    if is_like is not None:
                        item.is_like = True
                    items.append(item)
                return ResponseItemsSchema.Of(items, offset, l)
            except GetAllItemsException as e:
                raise ReviewsException(e.message) from e

    async def delete_review(self, review_id: int):
        async with self.__uow:
            try:
                await self.__uow.reviews.delete(id=review_id)
                await self.__uow.commit()
                return MessageSchema(message=REVIEW_DELETE_SUCCESS)
            except GetItemByIdException as e:
                raise ReviewsException(message=REVIEW_DELETE_FAILED) from e
            except DeleteItemException as e:
                raise ReviewsException(message=REVIEW_DELETE_FAILED) from e

    async def delete_user(self, user_id: int):
        async with self.__uow:
            try:
                await self.__uow.users.delete(id=user_id)
                await self.__uow.commit()
                return MessageSchema(message=USER_DELETE_SUCCESS)
            except GetItemByIdException as e:
                raise UsersException(message=USER_DELETE_FAILED) from e
            except DeleteItemException as e:
                raise UsersException(message=USER_DELETE_FAILED) from e

    async def put_review(self, review: ReviewPutSchema):
        async with self.__uow:
            try:
                review_db = await self.__uow.reviews.get_by_id(review.id)
                if review_db.type_id != TYPE_GUIDE:
                    review_db.mark = review.mark
                review_db.text = review.text
                review_db.change_date = datetime.now()
                await self.__uow.commit()
                return MessageSchema(message=REVIEW_UPDATE_SUCCESS)
            except ForeignKeyViolationException as e:
                raise ReviewsException(message=REVIEW_UPDATE_FAILED) from e
            except UpdateItemException as e:
                raise ReviewsException(message=REVIEW_UPDATE_FAILED) from e

    async def change_user(self, role_id_by_token: int, user: UserPutSchema):
        async with self.__uow:
            try:
                user_db = await self.__uow.users.get_by_id(user.id)
                if user_db is None:
                    raise UsersException(message=USER_NOT_FOUND)
                if role_id_by_token == ROLE_ID_ADMIN and user.role_id is not None:
                    user_db.role_id = user.role_id
                user_db.nickname = user.nickname
                user_db.email = user.email
                if user.password is not None:
                    user_db.password = self.__pwd_context.hash(user.password)
                user_db.firstname = user.firstname
                user_db.lastname = user.lastname
                user_db.telegram = user.telegram
                user_db.discord = user.discord
                await self.__uow.commit()
                return MessageSchema(message=USER_UPDATE_SUCCESS)
            except ForeignKeyViolationException as e:
                raise UsersException(message=USER_UPDATE_FAILED) from e
            except UpdateItemException as e:
                raise UsersException(message=USER_UPDATE_FAILED) from e

    async def post_delete_like(self, user_id: int, like: LikePostDeleteSchema):
        async with self.__uow:
            try:
                like_exist = await self.__uow.likes.get_one(
                    user_id=user_id, review_id=like.review_id
                )
                if like_exist is None:
                    like_db = Like(user_id=user_id, review_id=like.review_id)
                    await self.__uow.likes.add(like_db)
                    await self.__uow.commit()
                    return MessageSchema(message=LIKE_ADD_SUCCESS)
                await self.__uow.likes.delete(user_id=user_id, review_id=like.review_id)
                await self.__uow.commit()
                return MessageSchema(message=LIKE_DELETE_SUCCESS)
            except GetItemByIdException as e:
                raise LikesException(message=LIKE_ADD_FAILED) from e
            except ForeignKeyViolationException as e:
                raise LikesException(message=LIKE_ADD_FAILED) from e
            except AddItemException as e:
                raise LikesException(message=LIKE_ADD_FAILED) from e
            except DeleteItemException as e:
                raise LikesException(message=LIKE_ADD_FAILED) from e
