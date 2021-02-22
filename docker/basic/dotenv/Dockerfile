FROM python:3.8

# does not print anything
RUN echo $WEBADDRESS

COPY . .
RUN pip3 install -r requirements.txt
RUN python3 script.py

# does not print anything
RUN echo $WEBADDRESS

CMD python3 script.py

