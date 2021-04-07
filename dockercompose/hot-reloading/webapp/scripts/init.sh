#!/bin/bash

until PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -c "\q"; do
  >&2 echo "Postgres is not available, sleep..."
  sleep 1
done

>&2 echo "Postgres is up"

pwd
ls

cd /home/proj/
python3 manage.py makemigrations
python3 manage.py migrate

cd /home/proj/scripts/
./create_superuser.sh

cd /home/proj/
python3 manage.py runserver 0.0.0.0:8000
