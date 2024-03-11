from sqlalchemy import Column, ForeignKey, Integer

from db.db import Base


class Favourite(Base):
    __tablename__ = "favourites"
    
    legend_id = Column(Integer, ForeignKey("legends.id"), primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"), primary_key=True)