
# How

```
docker build -t myenv .
docker run -it myenv
```

```
docker-compose build
docker-compose up
```

# Note
* at build time, `echo` does not print anything
* at build time, `python3 script.py` prints the content in `.env` file
* at run time,
```
$ docker run -it --rm myenv
inside python: 127.0.0.1
```

* at run time,
```
$ docker-compose up
Creating network "dotenv_default" with the default driver
Creating dotenv_web_1 ... done
Attaching to dotenv_web_1
web_1  | inside python: abc.com.tw
dotenv_web_1 exited with code 0
```


