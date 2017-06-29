# bigstream-docker
a docker image for [BigStream](https://github.com/igridproject/node-bigstream)

## Build
```shellscript
docker build -t=igridproject/bigstream .
```

## Start Container
```shellscript
docker run --name node_bigstream -v /root/bigstream/data:/var/bigstream/data -p 19980:19980 -p 19080:19080 -p 19180:19180 -p 5672:5672 -it -d igridproject/bigstream
```
