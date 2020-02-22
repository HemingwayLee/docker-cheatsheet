# Terminologies

## Docker

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
