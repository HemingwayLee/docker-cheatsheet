FROM ubuntu:18.04

RUN apt-get update && apt-get -y install sudo cmake build-essential git pkg-config

RUN mkdir -p /home/test
WORKDIR /home/test

RUN git clone https://github.com/opencv/opencv.git
RUN git clone https://github.com/opencv/opencv_contrib.git

WORKDIR /home/test/opencv 
RUN git checkout 4.5.4
WORKDIR /home/test/opencv_contrib 
RUN git checkout 4.5.4

RUN mkdir -p /home/test/opencv/build
WORKDIR /home/test/opencv/build

RUN cmake -DOPENCV_EXTRA_MODULES_PATH=/home/test/opencv_contrib/modules ..
# The -j option tells make how many jobs (commands) to run in parallel. 
# This is limited by how many physical CPUs and RAM your system has
RUN make -j4
RUN make install

ENTRYPOINT /bin/bash

