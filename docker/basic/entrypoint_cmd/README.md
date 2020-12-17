# How to build
```
docker build -t my-test-linux .
```

# How to run

```
docker run -it --rm my-test-linux
docker run -it --rm my-test-linux "123\n"
```

It will print
```
I love docker
```

and

```
123
```

## Overwrite
* `CMD` can be overwritten, (e.g., official python dockerfile)
* Overwrite the original `ENTRYPOINT`, (e.g., `banst/awscli`)
```
docker run -it --rm --entrypoint /bin/bash my-test-linux:latest
```

## Overwrite by docker-compose
```
docker-compose -f docker-compose-override.yml up
```

# Note
* The `ENTRYPOINT` specifies a command that will always be executed when the container starts
* The `CMD` specifies arguments that will be fed to the `ENTRYPOINT`

https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
