from sqlalchemy.orm import relationship
from sqlalchemy import JSON, ForeignKey, Integer, String, Column

from db.db import Base


class FileModel(Base):
    __tablename__ = "files"

    token = Column(String(255), primary_key=True)
    owner_id = Column(Integer, ForeignKey("users.id"), nullable=True)
    details = Column(JSON)
