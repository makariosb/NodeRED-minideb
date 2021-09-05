# Node-RED Docker Image based on Debian
In this repository, you can find the Dockerfile I developed to build a stock Node-RED container based on bitnami's minideb distribution.

The main motivation behind this is the fact that the official nodered/node-red image is based on *Alpine Linux* for minimal footprint. That means the standard Linux C library is **musl libc**. In order to build some machine learning tools such as OpenCV, **glibc** is the preferred standard C library. 

And as such, I decided to build this image based on bitnami's [minimal debian NodeJS image](https://hub.docker.com/r/bitnami/node) using the official Node-RED [build-scripts](https://github.com/node-red/node-red-docker/tree/master/docker-custom), with some tweaking. 

In order to build this image in your linux machine, run
```bash
./docker-debian.sh
```

The image can then be ran using:
```bash
source <(head -n3 ./docker-debian.sh)
docker run -it -p 1880:1880 -v node_red_data:/data --name node-red-debian node-red-minideb:${NODE_VERSION}-v${NODE_RED_VERSION}
```