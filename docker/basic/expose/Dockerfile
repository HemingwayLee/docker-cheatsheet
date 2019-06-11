FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y nginx 

EXPOSE 80

# ENTRYPOINT nginx && bash
CMD ["nginx", "-g", "daemon off;"]

