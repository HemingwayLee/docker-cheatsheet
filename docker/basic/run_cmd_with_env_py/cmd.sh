#!/bin/bash

echo "works in here"
env AAA=aaa BBB=bbb python3 showme.py

echo "does not work in here"
python3 showme.py

echo "works again in here"
export AAA=ggyy
export BBB=12345
python3 showme.py

