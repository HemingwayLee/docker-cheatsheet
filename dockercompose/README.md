# Command

```
docker-compose build
docker-compose up
docker-compose down
```

`docker-compose up` will not rebuild the image although Dockerfile has changed, we need to use `docker-compose build`

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

