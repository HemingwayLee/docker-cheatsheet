# How to run
```
docker build -t my-nginx .
docker run -it --rm -p 80:80 my-nginx /bin/bash -c "nginx && /bin/bash"
docker stop <container_id>
```