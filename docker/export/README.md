# How to run
```
docker build -t my-export .
docker run -it --rm my-export
```

# How to use export
```
root@cde537e7b689:/home/mytest# export abc=10
root@cde537e7b689:/home/mytest# echo $abc
10
```

# Add path by using export `export PATH=$PATH:/home/mytest`
```
root@cde537e7b689:/home/mytest# echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

root@cde537e7b689:/home/mytest# export PATH=$PATH:/home/mytest
root@cde537e7b689:/home/mytest# echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/mytest

root@cde537e7b689:/home/mytest# cd ..
root@cde537e7b689:/home# cd ..

root@cde537e7b689:/# test.sh
hello, world
```
