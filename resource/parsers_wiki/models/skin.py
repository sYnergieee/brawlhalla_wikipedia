from sqlalchemy.orm import relationship
from sqlalchemy import Column, ForeignKey, String, Integer, Boolean, ARRAY

from db import Base
from models.chest_skin import ChestSkin
from models.event_skin import EventSkin
from models.weapon_skin import WeaponSkin


class Skin(Base):
    __tablename__ = "skins"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    img = Column(String(255), nullable=False)
    is_crossover = Column(Boolean, nullable=False)
    is_exclusive = Column(Boolean, nullable=False)
    cost = Column(Integer, nullable=True)
    purshase_info = Column(ARRAY(String), nullable=True)
    legend_id = Column(Integer, ForeignKey("legends.id"))

    chests = relationship(ChestSkin, backref='skin', cascade='all, delete')
    events = relationship(EventSkin, backref='skin', cascade='all, delete')
    weapons = relationship(WeaponSkin, backref='skin', cascade='all, delete')
