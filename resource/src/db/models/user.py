from sqlalchemy import Boolean, DateTime, ForeignKey, Integer, String, Column, Text
from sqlalchemy.orm import relationship

from db.db import Base
from datetime import datetime

from db.models.application import Application
from db.models.favourite import Favourite
from db.models.file import FileModel
from db.models.like import Like
from db.models.review import Review


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    nickname = Column(String(255), nullable=False, unique=True)
    email = Column(String(255), nullable=False, unique=True)
    firstname = Column(String(255), nullable=True)
    lastname = Column(String(255), nullable=True)
    password = Column(String(1024), nullable=False)
    reg_date = Column(DateTime, default=datetime.utcnow)
    telegram = Column(String(255), nullable=True)
    discord = Column(String(255), nullable=True)
    role_id = Column(Integer, ForeignKey("roles.id"))

    applications = relationship(Application, backref="user", cascade="all,delete")
    favourites = relationship(Favourite, backref="user", cascade="all,delete")
    likes = relationship(Like, backref="user", cascade="all,delete")
    reviews = relationship(Review, backref="user", cascade="all,delete")
    files = relationship(FileModel, backref="user", cascade="all,delete")
