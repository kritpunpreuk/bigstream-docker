# BigStream Docker
Docker Image for [BigStream](https://github.com/igridproject/node-bigstream)

from orginal bundle version : [bigstream-docker](https://github.com/igridproject/bigstream-docker)

see install docker-composer : [https://github.com/docker/compose/releases](https://github.com/docker/compose/releases)

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

## default environment variable (.env file)

image tag version
```
BIGSTREAM_TAG=latest
REDIS_TAG=3.2.11
RABBITMQ_TAG=3.6.12
```

bigstream datastore volumn path
```
BIGSTREAM_VOLUMN=./bigstreamdata
```

redis data volumn path
```
REDIS_VOLUMN=./redis/data
```

rabbitmq volumn and config path
```
RABBITMQ_VOLUMN=./rabbitmq/home
RABBITMQ_CONFIG=./rabbitmq/rabbitconf/rabbitmq.config
```

## Override default environment variable file
use export command 

eg. specified volumn mount for bigstream data
```
export BIGSTREAM_VOLUMN=NEWPATH
docker-compose up -d
```
some system using sudo command did not pass environment variable use sudo -E docker-compose up instread.
