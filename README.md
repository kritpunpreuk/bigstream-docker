# BigStream Docker
Docker Image for [BigStream](https://github.com/igridproject/node-bigstream)

from orginal bundle version : [bigstream-docker](https://github.com/igridproject/bigstream-docker)

## Start docker composer
```
git clone https://github.com/kritpunpreuk/bigstream-docker.git
cd bigstream-docker
docker-compose up
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
