#!/bin/bash

docker network create -d bridge --subnet 172.25.0.0/16 bigstream_nw

docker run --network=bigstream_nw -v $(pwd)/redis/data:/data --name redis_bigstream -d redis:3.2.11 redis-server --appendonly yes

docker run --network=bigstream_nw -v $(pwd)/rabbitmq/rabbitconf/rabbitmq.config:/etc/rabbitmq/rabbitmq.config -v $(pwd)/rabbitmq/home:/var/lib/rabbitmq -d --hostname rabbitmq_bigstream --name rabbitmq_bigstream rabbitmq:3.6.12

docker build -t=igridproject/bigstream_standalone bigstream/.

docker run --network=bigstream_nw -p 19980:19980 -p 19080:19080 -p 19180:19180 -v $(pwd)/bigstreamdata:/var/bigstream/data --name node_bigstream -d igridproject/bigstream_standalone
