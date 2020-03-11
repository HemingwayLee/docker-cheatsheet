FROM python:3.7

RUN apt-get update && apt-get install -y sudo postgresql postgresql-contrib

RUN pip3 install Django

COPY urls.py /
COPY init.sh /
COPY settings.py /
COPY create_superuser.sh /home/


