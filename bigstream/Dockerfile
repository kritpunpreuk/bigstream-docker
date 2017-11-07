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

# big-stream clone
RUN 	git clone https://github.com/igridproject/node-bigstream.git ~/node-bigstream
RUN 	npm install --prefix ~/node-bigstream
RUN		mkdir -p /var/bigstream/data
RUN	sed -i 's/127.0.0.1/redis_bigstream/g' ~/node-bigstream/conf/memstore.json
RUN     sed -i 's/127.0.0.1/rabbitmq_bigstream/g' ~/node-bigstream/conf/amqp.json

EXPOSE 19980 19080 19180

WORKDIR /root/node-bigstream

# start server
ENTRYPOINT 	pm2-docker pm2-default.json
