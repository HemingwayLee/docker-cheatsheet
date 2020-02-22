# Terminologies

## Docker

## Docker Compose
It is a tool for defining and running multiple containers by using yml file

## Docker Swarm

## Kubernetes

## Openshift

## Ref  
https://stackoverflow.com/questions/47536536/whats-the-difference-between-docker-compose-and-kubernetes  

# Cheatsheet  
Kill any stale or active containers:  
```
docker rm -f $(docker ps -aq)
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
