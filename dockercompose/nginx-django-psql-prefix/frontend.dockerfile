FROM python:3.7

RUN apt-get update && apt-get install -y \
  nginx \
  vim \
  gettext-base

RUN mkdir -p /var/www/html/abc

COPY aaa.html /var/www/html/abc/aaa.html
COPY nginx.conf.template /home/nginx.conf.template
COPY run_nginx.sh /home/run_nginx.sh

