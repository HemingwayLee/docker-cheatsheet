# How to run
```
docker build -t myenv .
docker run -it --rm myenv
```

* when we get into the folder, the .envrc will be loaded
```
$ docker run -it --rm mydir
direnv: loading .envrc
direnv: export ~lng
root@76daf0ea10e3:/home/mytest# echo $lng
eng
root@76daf0ea10e3:/home/mytest# cd ..
direnv: unloading
root@76daf0ea10e3:/home# echo $lng
jpn
root@76daf0ea10e3:/home# cd mytest/
direnv: loading .envrc
direnv: export ~lng
root@76daf0ea10e3:/home/mytest# echo $lng
eng
```
