from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from db import Base
from models.event_skin import EventSkin


class Event(Base):
    __tablename__ = "events"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

    skins = relationship(EventSkin, backref='event', cascade='all, delete')
