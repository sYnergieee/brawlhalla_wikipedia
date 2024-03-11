from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from db import Base
from models.legend_stat import LegendStat


class Stat(Base):
    __tablename__ = "stats"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

    legens = relationship(LegendStat, backref='stat', cascade='all, delete')
