# BigStream Docker
Docker Image for [BigStream](https://github.com/igridproject/node-bigstream)

from orginal bundle version : [bigstream-docker](https://github.com/igridproject/bigstream-docker)

## Start docker composer
```
cd bigstream-docker
docker-compose up -d
```
## Command
exec bigstream container shell
```
docker exec -it node_bigstream /bin/bash
```
monitor bigstream process
```
docker exec -it node_bigstream pm2 monit
```
restart all bigstream process
```
docker exec -it node_bigstream pm2 restart all
```
update bigstream from Git
```
docker exec -it node_bigstream git pull
```
see Redis or Rabbitmq logs
```
docker container logs redis_bigstream 
docker container logs rabbitmq_bigstream 
```

## Container mount path

bigstream datastore
```
bigstream-docker/bigstreamdata
```

rabbitmq hoem
```
bigstream-docker/rabbitmq/home
```

redis data
```
bigstream-docker/redis/data
```

