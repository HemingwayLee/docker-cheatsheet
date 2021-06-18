# How to run

```
docker build -t mytest .
docker run -it --rm -v /{your path}/docker-cheatsheet/docker/vol/here/:/home/ mytest

# This is also ok
docker run -it --rm -v $(pwd)/here:/home/ mytest
```

* The aaa.txt will be in `/home/` folder
* Run `touch bbb.txt` inside docker will create bbb.txt in `here/` folder outside of docker
* The `user.txt` created during `docker build` will not be in `/home/` folder

# Note
```
docker volume create myvol2
docker build -t mytest .
docker run -it --rm -v myvol2:/home/ mytest
```

when we run 
```
docker volume inspect myvol2
[
    {
        "CreatedAt": "2021-01-20T10:13:45Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/myvol2/_data",
        "Name": "myvol2",
        "Options": {},
        "Scope": "local"
    }
]
```

to get the `Mountpoint`
```
ls /var/lib/docker/volumes/myvol2/_data
ls: /var/lib/docker/volumes/myvol2/_data: No such file or directory
```

the folder `/var/lib/docker/volumes/myvol2/_data` does not exist, because Docker is still running inside a VM on Mac



