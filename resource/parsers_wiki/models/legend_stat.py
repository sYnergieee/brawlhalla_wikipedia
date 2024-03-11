from sqlalchemy import Column, ForeignKey, Integer

from db import Base


class LegendStat(Base):
    __tablename__ = "legend_stats"
    stat_id = Column(Integer, ForeignKey("stats.id"), primary_key=True)
    legend_id = Column(Integer, ForeignKey("legends.id"), primary_key=True)
    value = Column(Integer, ForeignKey("stat_imgs.value"))
