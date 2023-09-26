from sqlalchemy import create_engine, MetaData

engine = create_engine("postgresql://admin:password@postgres:5432/storedb")

meta = MetaData()

conn = engine.connect()
