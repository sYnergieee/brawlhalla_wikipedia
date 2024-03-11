from sqlalchemy import Column, ForeignKey, Integer, Text
from sqlalchemy.orm import relationship

from db.db import Base


class Application(Base):
    __tablename__ = "applications"

    id = Column(Integer, primary_key=True)
    text = Column(Text, nullable=False)
    default_user_id = Column(Integer, ForeignKey("users.id"))
