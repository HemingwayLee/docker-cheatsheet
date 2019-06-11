FROM ubuntu:16.04

#https://superuser.com/questions/718916/problems-installing-ping-in-docker
RUN apt-get update && apt-get install -y iputils-ping

ENTRYPOINT ["/bin/ping"]
CMD ["localhost"]
