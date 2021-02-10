# Prepare
```
docker pull registry
docker run -d -p 5000:5000 --restart always --name registry registry:2
```

# Push
```
docker tag ubuntu:18.04 localhost:5000/ubuntu:5566
docker push localhost:5000/ubuntu:5566
```

## Check with browser or `curl`
```
$ curl -X GET http://localhost:5000/v2/_catalog
{"repositories":["ubuntu"]}
```
