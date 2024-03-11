from abc import ABC, abstractmethod
from typing import Callable
from redis import Redis
from sqlalchemy.ext.asyncio import AsyncSession

import legend.repositories as legend
import skin.repositories as skin
import user.repositories as user
import file_operator.repositories as file
import authentication.repositories as auth


class IUnitOfWork(ABC):
    legends: legend.ILegendRepository
    stats: legend.IStatRepository
    weapons: legend.IWeaponRepository
    weapon_skins: legend.IWeaponSkinsRepository
    weapon_legends: legend.IWeaponLegendRepository
    legend_stats: legend.ILegendStatRepository
    skins: skin.ISkinRepository
    events: skin.IEventRepository
    event_skins: skin.IEventSkinRepository
    chests: skin.IChestRepository
    chest_skins: skin.IChestSkinRepository
    users: user.IUserRepository
    applications: user.IApplicationRepository
    favourites: user.IFavouriteRepository
    reviews: user.IReviewRepository
    likes: user.ILikeRepository
    files: file.IFileRepository
    password_recs: auth.IPasswordRecsRepository

    @abstractmethod
    async def __aenter__(self): ...

    @abstractmethod
    async def __aexit__(self): ...

    @abstractmethod
    async def commit(self):
        raise NotImplementedError()

    @abstractmethod
    async def rollback(self):
        raise NotImplementedError()


class UnitOfWork(IUnitOfWork):
    def __init__(self, session_maker: Callable[[], AsyncSession], redis_conect: Redis):
        self.__session_maker = session_maker
        self.__redis_conect = redis_conect

    async def __aenter__(self):
        self.__session: AsyncSession = self.__session_maker()

        self.legends = legend.LegendRepository(self.__session)
        self.stats = legend.StatRepository(self.__session)
        self.weapons = legend.WeaponRepository(self.__session)
        self.weapon_skins = legend.WeaponSkinsRepository(self.__session)
        self.weapon_legends = legend.WeaponLegendRepository(self.__session)
        self.legend_stats = legend.LegendStatRepository(self.__session)
        self.skins = skin.SkinRepository(self.__session)
        self.events = skin.EventRepository(self.__session)
        self.event_skins = skin.EventSkinRepository(self.__session)
        self.chests = skin.ChestRepository(self.__session)
        self.chest_skins = skin.ChestSkinRepository(self.__session)
        self.users = user.UserRepository(self.__session)
        self.applications = user.ApplicationRepository(self.__session)
        self.favourites = user.FavouriteRepository(self.__session)
        self.reviews = user.ReviewRepository(self.__session)
        self.likes = user.LikeRepository(self.__session)
        self.files = file.FileRepository(self.__session)
        self.password_recs = auth.PasswordRecsRepository(self.__redis_conect)

        return await super().__aenter__()

    async def __aexit__(self, *args):
        await self.rollback()
        await self.__session.close()

    async def commit(self):
        await self.__session.commit()

    async def rollback(self):
        await self.__session.rollback()
