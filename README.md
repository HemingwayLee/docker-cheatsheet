# docker-cheatsheet

## Architecture
![arch1](https://geekflare.com/wp-content/uploads/2019/09/traditional-vs-new-gen.png)

## Basic commands
![commands](https://geekflare.com/wp-content/uploads/2019/09/docker-architecture.png)

## Compare to VM
| VM | docker container |
| --- | --- |
| Each VM has its own OS | Each container can share OS |
| Boots in Minutes | Boots in seconds |
| Few GBs in size | Few KBs/MBs in size |
| Can move to new host easily | Destroyed or re-created rather than moving |

## Docker Hub
This is the official registry which is used to host various Docker images.

## Private docker registry
* We need to login first:  
```
docker login xxx.azurecr.io
```

* pull from private repo
```
docker pull xxx.azurecr.io/my_nginx:51
```

* push to private repo
```
docker tag my_ubuntu xxx.azurecr.io/my_ubuntu
docker push xxx.azurecr.io/my_ubuntu
```

### Layer in docker
Every line in a dockerfile will create a layer  
```
FROM ubuntu             #This has its own number of layers say "X"
RUN mkdir /tmp/foo      #This is one layer 
RUN apt-get install vim #This is one layer 
```

`docker images` only shows container layers (not images layers)
![layers](https://i.stack.imgur.com/J2cge.jpg)

## Docker Compose
It is a tool for defining and running multiple containers by using yml file

## Docker Swarm

## Kubernetes

## Openshift

## Ref  
https://stackoverflow.com/questions/47536536/whats-the-difference-between-docker-compose-and-kubernetes  

# Cheatsheet  
## docker build (dockerfile to image)
```
docker build -t dockhello -f ./dockhello .
docker build -t docker-jenkins .
```

`-t`: Tag an image  
`-f`: Specify a dockerfile file name (we still need a `.` in the end of the command)  

## docker run (docker image to docker container)

```
docker run dockhello
docker run -p 8080:8080 -p 50000:50000 docker-jenkins
docker run -d -p 8080:8080 -p 50000:50000 docker-jenkins
docker run -i -t ubuntu-test
docker run -it --rm my-ubuntu
docker run -it --rm -p 52022:22 my-ubuntu
```

`-d`: detached mode  
`-p`: Publish a container's port or a range of ports to the host  
`-it`: For interactive processes (like a shell), you must use `-i` `-t` together in order to allocate a tty for the container process. `-i` `-t` is often written `-it`  
`--rm`: delete docker container automatically after "exit"  

## Kill any stale containers
```
docker rm -f $(docker ps -aq)
```

Or in new version of docker:
```
docker container prune
```

## Get access host services (e.g., database) from a docker container
```
docker.for.mac.host.internal
```

## Get into a running docker container
```
docker exec -it {container_id} /bin/bash
```

## Copy file from/into docker
```
docker cp foo.txt {container_id}:/foo.txt
docker cp {container_id}:/foo.txt foo.txt
```

## Network
```
docker network create --subnet=172.18.0.0/16 mynet123
docker run --net mynet123 --ip 172.18.0.15 -it --rm -p 30001:27017 my-mongo1
docker run --net mynet123 --ip 172.18.0.14 -it --rm -p 30002:27017 my-mongo2
docker run --net mynet123 --ip 172.18.0.13 -it --rm -p 30003:27017 my-mongo3
```

### Clear any cached networks 
```
docker network prune
```

# Security
Bad: `FROM python:latest`
Better: `FROM python:3.7.6`
Best: `FROM python:3.7.6@sha256:xxxxxxx`



# Note
## Volume


# Hint
* `From python:3.6` might get different OS if we build dockerfile in different environments
  * Use `docker build --no-cache -t u12_core .` will build it from scratch without using old cached python3.6
* we need `#!/bin/bash` at the first line of the `.sh` file if we want to run `.sh` file in some docker environment
* Docker container will automatically stop after `docker run -d` sometimes, it does not mean the dockerfile has some issues
* Multiple base images (multiple `FROM` statement) is ok in the newer version of docker
* Exited (`Exited(0)`) and dead (`Exited(1)`)  container are different
