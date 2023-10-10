from sqlalchemy import create_engine, MetaData
from sqlalchemy.exc import OperationalError

engine = create_engine("postgresql+psycopg2://admin:password@postgres:5432/storedb",
                    pool_pre_ping=True,
                    connect_args={
                        "keepalives": 1,
                        "keepalives_idle": 30,
                        "keepalives_interval": 10,
                        "keepalives_count": 5,
                    })

meta = MetaData()
conn = engine.connect()

