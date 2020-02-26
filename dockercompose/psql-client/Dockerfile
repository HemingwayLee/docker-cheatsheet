FROM ubuntu:16.04

RUN apt-get update && apt-get install -y sudo postgresql postgresql-contrib

RUN ls
COPY init.sh /

# The RUN is executed only when you are building the image
#  The psql container is not running at this point, nor has the network been created

# Instead, we should use CMD or ENTRYPOINT
# RUN sudo -u postgres psql -h mydb -p 5432 -c "CREATE DATABASE abc;"

