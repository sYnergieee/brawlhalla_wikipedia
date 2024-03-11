from sqlalchemy import Column, ForeignKey, String, Integer
from db import Base


class WeaponSkin(Base):
    __tablename__ = "weapon_skins"

    weapon_id = Column(Integer, ForeignKey("weapons.id"), primary_key=True)
    skin_id = Column(Integer, ForeignKey("skins.id"), primary_key=True)
    img = Column(String(255), nullable=False)
    name = Column(String(255), nullable=False)
