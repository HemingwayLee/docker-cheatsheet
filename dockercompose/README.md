# Command

```
docker-compose build
docker-compose up
docker-compose down
```

`docker-compose up` will not rebuild the image although Dockerfile has changed, we need to use `docker-compose build`

## Run multiple docker-compose command
```
docker-compose -f docker-compose1.yml -f docker-compose2.yml up
```

# showcase
## Hello world for django application
* `hello-django`

## Busy waiting for psql container to setup
* `psql-client`

## Django works with psql
* `django-psql`
  * docker-compose build with context

# Note
* `nginx` related folders still need to fix, they are not connect with psql

# Hints
* We can divide a single docker-compose file into multiple separate docker-compose files using the same `network`, after building all separate docker-compose files, the result is the same 
  * use shell script to build them
    * we can have a more detailed control of building process, e.g., 
      * use GPU image or not
      * behind proxy or not
      * use queue/cache or not
  * In a single docker-compose file, if we need a conditional variable
  ```
  volumes:
      ${VARIABLE:-/dev/null}:/app/folder
  ```
