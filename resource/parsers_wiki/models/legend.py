from sqlalchemy import ForeignKey, Integer, String, Column, Text
from sqlalchemy.orm import relationship

from db import Base
from models.legend_skin import LegendSkin
from models.legend_stat import LegendStat
from models.weapon_legend import WeaponLegend


class Legend(Base):
    __tablename__ = "legends"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    aka_name = Column(String(255), nullable=False)
    description = Column(Text, nullable=False)
    cost = Column(Integer, nullable=True)
    img_main = Column(String(255), nullable=True)
    img_short = Column(String(255), nullable=True)
    release_info = Column(String(255), nullable=True)
    
    skins = relationship(LegendSkin, backref='legend', cascade='all, delete')
    weapons = relationship(WeaponLegend, backref='legend', cascade='all, delete')
    stats = relationship(LegendStat, backref='legend', cascade='all, delete')
