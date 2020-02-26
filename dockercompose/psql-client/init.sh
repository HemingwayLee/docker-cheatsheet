#!/bin/bash

until PGPASSWORD=pass psql -h ${DBHOST:-mydb} -p 5432 -U postgres -c "\q"; do
  >&2 echo "Postgres is not available, sleep..."
  sleep 1
done

>&2 echo "Postgres is up"

PGPASSWORD=pass psql -h ${DBHOST:-mydb} -p 5432 -U postgres -c "CREATE DATABASE def;"

