from sqlalchemy import Column, ForeignKey, String, Integer

from db import Base


class WeaponLegend(Base):
    __tablename__ = "weapon_legends"

    weapon_id = Column(Integer, ForeignKey("weapons.id"), primary_key=True)
    legend_id = Column(Integer, ForeignKey("legends.id"), primary_key=True)
    img = Column(String(255), nullable=True)
    name = Column(String(255), nullable=True)
