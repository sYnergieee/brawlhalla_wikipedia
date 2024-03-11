from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import relationship

from db.db import Base
from db.models.review import Review


class TypeReview(Base):
    __tablename__ = "type_reviews"

    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

    reviews = relationship(Review, backref="type_review", cascade="all,delete")
