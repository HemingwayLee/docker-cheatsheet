FROM python:3.8

RUN mkdir -p /home/app
COPY . /home/app
WORKDIR /home/app

RUN pip3 install -r requirements.txt
ENV FLASK_APP=hello.py

CMD ["flask", "run", "--host=0.0.0.0"]

