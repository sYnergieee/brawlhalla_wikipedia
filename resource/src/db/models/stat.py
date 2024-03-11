from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from db.db import Base
from db.models.legend_stat import LegendStat


class Stat(Base):
    __tablename__ = "stats"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    img = Column(String(255), nullable=False)

    legends = relationship(LegendStat, backref='stat', cascade='all, delete')
