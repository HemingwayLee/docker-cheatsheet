# Terminologies

## Docker

## Compare to VM
| VM | docker container |
| --- | --- |
| Each VM has its own OS | Each container can share OS |
| Boots in Minutes | Boots in seconds |
| Few GBs in size | Few KBs/MBs in size |
| Can move to new host easily | Destroyed or re-created rather than moving |

## Private docker repo
We need to login first:  
```
docker login xxx.azurecr.io
```

### pull from private repo
```
docker pull xxx.azurecr.io/my_nginx:51
```

### push to private repo
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

[!layers](https://i.stack.imgur.com/J2cge.jpg)

## Docker Compose
It is a tool for defining and running multiple containers by using yml file

## Docker Swarm

## Kubernetes

## Openshift

## Ref  
https://stackoverflow.com/questions/47536536/whats-the-difference-between-docker-compose-and-kubernetes  

# Cheatsheet  
Kill any stale containers:  
```
docker rm -f $(docker ps -aq)
```

Or in new version of docker:
```
docker container prune
```

Clear any cached networks:  
```
docker network prune
```

# Note
## Volume


# Hint
* `From python:3.6` might get different OS if we build dockerfile in different environments
* we need `#!/bin/bash` at the first line of the `.sh` file if we want to run `.sh` file in some docker environment
* Docker container will automatically stop after `docker run -d` sometimes, it does not mean the dockerfile has some issues
* Multiple base images (multiple `FROM` statement) is ok in the newer version of docker
