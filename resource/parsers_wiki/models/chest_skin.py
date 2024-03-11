from sqlalchemy import ForeignKey, Column, Integer

from db import Base


class ChestSkin(Base):
    __tablename__ = "chest_skins"

    chest_id = Column(Integer, ForeignKey("chests.id"), primary_key=True)
    skin_id = Column(Integer, ForeignKey("skins.id"), primary_key=True)
