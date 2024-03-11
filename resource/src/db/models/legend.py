from sqlalchemy import ForeignKey, Integer, String, Column, Text
from sqlalchemy.orm import relationship
from sqlalchemy.ext.hybrid import hybrid_property

from db.db import Base
from db.models.favourite import Favourite
from db.models.skin import Skin
from db.models.legend_stat import LegendStat
from db.models.review import Review
from db.models.weapon_legend import WeaponLegend
from const import *


class Legend(Base):
    __tablename__ = "legends"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    aka_name = Column(String(255), nullable=False)
    description = Column(Text, nullable=False)
    cost = Column(Integer, nullable=False)
    img_main = Column(String(255), nullable=False)
    img_short = Column(String(255), nullable=False)
    release_info = Column(String(255), nullable=False)

    skins = relationship(Skin, backref="legend", cascade="all, delete")
    weapons = relationship(WeaponLegend, backref="legend", cascade="all, delete")
    stats = relationship(LegendStat, backref="legend", cascade="all, delete")
    favourites = relationship(Favourite, backref="legend", cascade="all,delete")
    reviews = relationship(Review, backref="legend", cascade="all,delete")

    @hybrid_property
    def count_reviews(self):
        review_type = 0
        guide_type = 0
        for r in self.reviews:
            if r.type_id == TYPE_REVIEW:
                review_type += 1
            if r.type_id == TYPE_GUIDE:
                guide_type += 1
        return {"review_count": review_type, "guide_type": guide_type}
