from sqlalchemy.orm import relationship
from sqlalchemy import Column, Integer, String

from db.db import Base
from db.models.legend_stat import LegendStat


class StatImg(Base):
    __tablename__ = "stat_imgs"

    value = Column(Integer, primary_key=True)
    img = Column(String(255), nullable=False)

    legend_stats = relationship(
        LegendStat, backref='stat_img', cascade='all, delete')
