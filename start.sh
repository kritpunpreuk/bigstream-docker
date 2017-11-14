#!/bin/bash

### Add custom environment here

# bigstream data path
#export BIGSTREAM_VOLUMN=./bigstreamdata

# redis data path
#export REDIS_VOLUMN=./redis/data

# rabbitmq data path
#export RABBITMQ_VOLUMN=./rabbitmq/home

# Start docker composer
docker-composer up -d
