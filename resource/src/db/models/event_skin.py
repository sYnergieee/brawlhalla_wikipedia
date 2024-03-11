from sqlalchemy import Column, ForeignKey, Integer

from db.db import Base


class EventSkin(Base):
    __tablename__ = "event_skins"
    
    event_id = Column(Integer, ForeignKey("events.id"), primary_key=True)
    skin_id = Column(Integer, ForeignKey("skins.id"), primary_key=True)