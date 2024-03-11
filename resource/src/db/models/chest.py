from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import relationship

from db.db import Base
from db.models.chest_skin import ChestSkin


class Chest(Base):
    __tablename__ = "chests"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    img = Column(String(255), nullable=False)
    cost = Column(Integer, nullable=False)

    skins = relationship(ChestSkin, backref='chest', cascade='all, delete')