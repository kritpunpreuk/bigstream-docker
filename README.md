# BigStream Docker
Docker Image for [BigStream](https://github.com/igridproject/node-bigstream)

see: Docker CE Installation [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

## Build
ทำการ build image จาก Dockerfile
```
docker build -t=igridproject/bigstream .
```

## Run Container
* เปิด port 19080,19180,19980,5672
* mount volume ของ bigstream storage data ซึ่งเก็บอยู่ที่ /var/bigstream/data
```
docker run --name node_bigstream -v /root/bigstream/data:/var/bigstream/data \
-p 19980:19980 -p 19080:19080 -p 19180:19180 -p 5672:5672 -it \
-d igridproject/bigstream
```

## Command
* exec bigstream container shell
```
docker exec -it node_bigstream /bin/bash
```
* monitor bigstream process
```
docker exec -it node_bigstream pm2 monit
```
* restart all bigstream process
```
docker exec -it node_bigstream pm2 restart all
```

* update bigstream from Git
```
docker exec -it node_bigstream git pull
```