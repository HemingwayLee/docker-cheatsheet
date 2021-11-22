FROM ubuntu:16.04

#install multiple package
RUN apt-get update && apt-get install -y nodejs npm vim

#check the version
RUN nodejs -v

#execute file
RUN mkdir -p /home/hello
WORKDIR /home/hello
RUN echo "console.log('Hello, World');" > hello.js
RUN nodejs hello.js

#module 
RUN echo "var a = 1;" > myMod.js
RUN echo "module.exports.a = a;" >> myMod.js
RUN echo "module.exports.b = 5566;" >> myMod.js
RUN echo "var m = require('./myMod');" > exe.js 
RUN echo "console.log(m.a);" >> exe.js
RUN echo "console.log(m.b);" >> exe.js
RUN nodejs exe.js

RUN mkdir -p /home/pkg
WORKDIR /home/pkg
COPY package.json /home/pkg/package.json
RUN npm install -l

RUN mkdir -p /home/sample
WORKDIR /home/sample
RUN npm install express
COPY app.js /home/sample/app.js

#we can run npm ls to check the installation
#we can run npm ls -g to check the global installation

ENTRYPOINT nodejs app.js && /bin/bash
#http://localhost:8088/
