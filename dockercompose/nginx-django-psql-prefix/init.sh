#!/bin/bash

until PGPASSWORD=pass psql -h ${DBHOST} -p 5432 -U postgres -c "\q"; do
  >&2 echo "Postgres is not available, sleep..."
  sleep 1
done

>&2 echo "Postgres is up"

cd /home/
django-admin startproject mysite

cd /home/mysite
python3 manage.py makemigrations
python3 manage.py migrate

mv /home/create_superuser.sh /home/mysite
./create_superuser.sh

mv /settings.py /home/mysite/mysite
mv /urls.py /home/mysite/mysite

python3 manage.py runserver 0.0.0.0:8000
