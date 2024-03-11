from sqlalchemy import Column, DateTime, ForeignKey, Integer, String, Text
from sqlalchemy.orm import relationship
from sqlalchemy.ext.hybrid import hybrid_property

from db.db import Base
from db.models.like import Like
from datetime import datetime


class Review(Base):
    __tablename__ = "reviews"

    id = Column(Integer, primary_key=True)
    text = Column(Text, nullable=True)
    mark = Column(Integer, nullable=True)
    legend_id = Column(Integer, ForeignKey("legends.id"))
    user_id = Column(Integer, ForeignKey("users.id"))
    type_id = Column(Integer, ForeignKey("type_reviews.id"))
    date = Column(DateTime, default=datetime.utcnow)
    change_date = Column(DateTime, nullable=True)

    likes = relationship(Like, backref="review", cascade="all,delete")

    @hybrid_property
    def count_likes(self):
        return len(self.likes)
        
