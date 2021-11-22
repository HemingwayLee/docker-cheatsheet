FROM ubuntu:18.04

RUN apt-get update && apt-get install -y vim direnv
RUN mkdir -p /home/mytest
WORKDIR /home/mytest
COPY . .
RUN ls -a

ENV lng 'jpn'
RUN echo $lng
RUN echo ${lng}

RUN which direnv
# zsh does not support for now
RUN echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
RUN direnv allow .
RUN echo $lng

