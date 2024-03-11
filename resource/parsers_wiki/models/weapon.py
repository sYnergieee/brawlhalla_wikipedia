from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from db import Base
from models.legend import Legend
from models.weapon_legend import WeaponLegend
from models.weapon_skin import WeaponSkin


class Weapon(Base):
    __tablename__ = "weapons"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    img = Column(String(255), nullable=False)

    legends = relationship(
        WeaponLegend, backref='weapon', cascade='all, delete')
    skins = relationship(WeaponSkin, backref='weapon', cascade='all, delete')
