SELECT ROW_NUMBER() OVER () AS num
FROM pg_catalog.pg_class
LIMIT 10000