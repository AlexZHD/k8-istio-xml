from database import Base
from sqlalchemy import Column, Integer, String
from sqlalchemy.types import DateTime

class Items(Base):
    """
    Items table
    """
    __tablename__ = 'files'
    id = Column(Integer, primary_key=True)
    name = Column(String(256))
    status = Column(String(256))
    date_added = Column(DateTime())
