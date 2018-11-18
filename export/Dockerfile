FROM ubuntu:16.04

RUN mkdir -p /home/mytest
WORKDIR /home/mytest

RUN echo "echo 'hello, world'" >> test.sh
RUN chmod 777 test.sh

ENTRYPOINT ["/bin/bash"]


