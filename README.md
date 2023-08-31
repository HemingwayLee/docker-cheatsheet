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

## Ref  
https://stackoverflow.com/questions/47536536/whats-the-difference-between-docker-compose-and-kubernetes  

# Cheatsheet  
## docker build (dockerfile to image)
```
docker build -t dockhello -f ./dockhello .
docker build -t docker-jenkins .
```

* `-t`: Tag an image  
* `-f`: Specify a dockerfile file name (we still need a `.` in the end of the command)  
* `--progress=plain`: show console output result when building

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
* Network need to be created on on-premise server to avoid conflict [issue](https://jkbys.net/docker%E3%81%8C%E8%87%AA%E5%8B%95%E3%81%A7%E5%89%B2%E3%82%8A%E5%BD%93%E3%81%A6%E3%82%8Bip%E3%82%A2%E3%83%89%E3%83%AC%E3%82%B9%E3%81%AE%E7%AF%84%E5%9B%B2%E3%82%92%E6%8C%87%E5%AE%9A)
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

### Remove all dangling build caches
```
docker builder prune
```
* `--all`, `-a`, Remove all unused build cache, not just dangling ones

# Security
Bad: `FROM python:latest`  
Better: `FROM python:3.7.6`  
Best: `FROM python:3.7.6@sha256:xxxxxxx`  

## How to get hash
* From docker hub
![python_hash](https://user-images.githubusercontent.com/8428372/84723476-a381dd00-afc0-11ea-8131-d8a94b9d957b.png)

* Run `docker inspect {image id}`
```
$ docker images
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
postgres              latest              dd4fa36a9c2f        3 months ago        395MB
python                3.7                 879165535a54        4 months ago        919MB
ubuntu                18.04               775349758637        7 months ago        64.2MB
ubuntu                16.04               5e8b97a2a082        2 years ago         114MB
```

```
$ docker inspect 879165535a54
[
    {
        "Id": "sha256:879165535a540e8d915b6b6f665eca37abcd56b3b2a3510035035b23514eca4b",
        "RepoTags": [
            "python:3.7"
        ],
        "RepoDigests": [
            "python@sha256:6f5d5cc9624c5bb4a360c0a27e2e1c5afe4358adf0b25fe14c9ee6198048eac0"
        ],
```
Choose `RepoDigests`, not `Id`

* we can also pull with hash
```
docker pull jupyter/tensorflow-notebook@sha256:960351dcb9da1d5b57f5d57c32a8295a3231a28248b71491aba4f79a01e36ddd
```

# Volume
By default all files created inside a container are stored on a writable container layer. This means that:
* The data doesn’t persist when that container no longer exists
* It can be difficult to get the data out of the container if another process needs it

Volumes are the preferred mechanism to store data generated by and used by Docker containers

## Check/Clean/Create volume
```
docker volume ls
docker volume prune
docker volume create myvol
docker volume inspect myvol
docker volume rm myvol
```

# Hint
* `From python:3.6` might get different OS if we build dockerfile in different environments
  * Use `docker build --no-cache -t u12_core .` will build it from scratch without using old cached python3.6
* we need `#!/bin/bash` at the first line of the `.sh` file if we want to run `.sh` file in some docker environment
  * When we use `#!/bin/bash` then we tell the environment os to use bash as a command interpreter.
  * If we install many versions of Python, then `#!/usr/bin/env` ensures that the interpreter will use the first installed version on your environment's `$PATH`
* Docker container will automatically stop after `docker run -d` sometimes, it does not mean the dockerfile has some issues
* Multiple base images (multiple `FROM` statement) is ok in the newer version of docker

* Exited (`Exited(0)`) and dead (`Exited(1)`)  container are different
  * If we the nginx in the background inside docker container, it is okay to use `-it` option, but it will be in `Exited(0)` status if we run it in `-d` mode

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                              PORTS               NAMES
26d4849fe5ed        mynginx             "/bin/sh -c '/etc/in…"   4 seconds ago       Exited (0) Less than a second ago                       clever_mirzakhani
``` 

  * Run the nginx in foreground so that we can run it with `-d` option and it works correctly on the cloud (both AWS and Azure)

* When building a docker image, it is in interactive mode. We need to do the following command in Dockerfile 
```
(echo "initial command" && cat) | some_tool
(echo "yes" && cat)  | ./bin/install-mecab-ipadic-neologd -n
```
* It is ok not to have `CMD` and `ENTRYPOINT` in the dockerfile
* When we are behind proxy, we need to use a customized `pip.conf` file during the building process to specify
  * proxy, trusted_host, ssl_verify
* We can docker build/save/load/tag docker images in a limited network environment
