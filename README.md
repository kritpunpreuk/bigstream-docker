# BigStream Docker (Separate service version)
Docker Image for [BigStream](https://github.com/igridproject/node-bigstream)

see: Docker CE Installation [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

see: bundle version [igridproject/bigstream-docker/](https://github.com/igridproject/bigstream-docker)

## git clone
```
git clone https://github.com/kritpunpreuk/bigstream-docker.git
```

## Start docker composer
```
cd bigstream-docker
docker-compose up
```

## Mount path

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
