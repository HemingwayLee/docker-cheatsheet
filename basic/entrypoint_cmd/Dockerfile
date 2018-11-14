FROM ubuntu:16.04

#https://superuser.com/questions/718916/problems-installing-ping-in-docker
RUN apt-get update && apt-get install -y iputils-ping

ENTRYPOINT ["/bin/ping"]
CMD ["localhost"]

#docker run -it --rm my-test-linux
#docker run -it --rm my-test-linux www.google.com



#Ref:
# The ENTRYPOINT specifies a command that will always be executed when the container starts.
# The CMD specifies arguments that will be fed to the ENTRYPOINT.
#https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
