FROM ubuntu
MAINTAINER GCS
################# Install packages #############################
# install curl, wget, git, vim, python
RUN 	apt-get update && apt-get install -y curl && apt-get install -y wget && apt-get install -y git && apt-get install -y python && \
	apt-get install -y vim && apt-get install -y libssl-dev

# nodeJS
RUN	curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN	apt-get install -y nodejs
RUN	apt-get install -y build-essential


# pm2
RUN	npm install -y pm2@latest -g
	
# redis
RUN	apt-get install -y redis-server


# rabbitmq
RUN	echo 'deb http://www.rabbitmq.com/debian/ testing main' | \
     	tee /etc/apt/sources.list.d/rabbitmq.list
RUN	wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | \
     	apt-key add -
RUN	apt-get update
RUN	apt-get install -y rabbitmq-server

# edit redis conf
RUN	sed -i 's/appendonly no/appendonly yes/g' /etc/redis/redis.conf
RUN	sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

# rabbit conf
ADD rabbit_conf/* /etc/rabbitmq/
################################################################

# big-stream clone
RUN 	git clone https://github.com/igridproject/node-bigstream.git ~/node-bigstream
RUN 	npm install --prefix ~/node-bigstream
RUN		mkdir -p /var/bigstream/data

EXPOSE 19980 19080 19180 6379 5672

WORKDIR /root/node-bigstream

# start server
ENTRYPOINT 	rabbitmq-server -detached && \
		/etc/init.d/redis-server start  && \
		sleep 3  && \
		pm2-docker pm2-default.json
