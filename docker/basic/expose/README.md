
# How

## Build 
```
docker build -t my-expose .
```

## Run
```
docker run -d -p 80:80 my-expose
docker run -it -p 80:80 my-expose
```

## Clean
```
docker stop <docker_container>
```

### `EXPOSE`
* Use `-P` option will map a random ip on the host OS
```
docker run -P -it --rm my-expose
```

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                   NAMES
d3373145946b        my-expose           "nginx -g 'daemon of…"   16 seconds ago      Up 13 seconds       0.0.0.0:32768->80/tcp   modest_benz
```


