from sqlalchemy import Integer, String, Column
from sqlalchemy.orm import relationship

from db.db import Base
from db.models.user import User


class Role(Base):
    __tablename__ = "roles"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False, unique=True)

    users = relationship(User, backref='role')