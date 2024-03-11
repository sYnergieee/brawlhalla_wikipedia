from sqlalchemy import Column, ForeignKey, Integer

from db import Base


class LegendSkin(Base):
    __tablename__ = "legend_skins"

    legend_id = Column(Integer, ForeignKey("legends.id"), primary_key=True)
    skin_id = Column(Integer, ForeignKey("skins.id"), primary_key=True)
