#!/bin/bash
envsubst '$MY_IP $MY_PORT' < /home/nginx.conf.template > /etc/nginx/sites-enabled/default

nginx -g 'daemon off;'
