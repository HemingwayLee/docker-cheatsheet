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
`From python:3.6` might get different OS if we build dockerfile in different environments

