from sqlalchemy import Column, ForeignKey, Integer

from db.db import Base


class Like(Base):
    __tablename__ = "likes"
    
    review_id = Column(Integer, ForeignKey("reviews.id"), primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"), primary_key=True)