FROM ubuntu:16.04

ARG user
ARG pwd

RUN echo "$user has $pwd"

WORKDIR /home/
RUN echo "$user has $pwd" > user.txt
RUN cat user.txt
