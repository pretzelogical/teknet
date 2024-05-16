from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
# from typing import Union

# DBModel = Union[user]


class DB:
    """ Database connection """
    def __init__(self, conn: str = 'sqlite:///:memory:'):
        self.__engine = create_engine(conn, echo=True)
        Session = sessionmaker(bind=self.__engine)
        self.__session = Session()

    # def add(self, addition: Union[list, DBModel]):
    def add(self, addition):
        self.__session.add(addition)
        self.__session.commit()
