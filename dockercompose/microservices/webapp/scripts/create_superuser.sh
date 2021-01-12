#!/bin/bash

USER="ywlee"
PASS="pwd"
MAIL="ywlee@gmail.com"
SCRIPT="
from django.contrib.auth.models import User
username = '$USER'
password = '$PASS'
email = '$MAIL'
if User.objects.filter(username=username).count()==0:
  User.objects.create_superuser(username, email, password)
  print('Super user created!')
else:
  print('Skip! super user exists...')
"

printf "$SCRIPT" | python3 /home/proj/manage.py shell

