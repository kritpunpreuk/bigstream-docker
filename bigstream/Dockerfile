FROM ubuntu
MAINTAINER KP

# Updated : 23 Nov 2017

################# Install packages #############################
# install curl, wget, git, vim, python
RUN apt-get update 
RUN apt-get install -y curl wget git python vim libssl-dev

# nodeJS
RUN	curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN	apt-get install -y nodejs
RUN	apt-get install -y build-essential

# pm2
RUN	npm install -y pm2@latest -g

# big-stream clone
RUN git clone https://github.com/igridproject/node-bigstream.git ~/node-bigstream

WORKDIR /root/node-bigstream

RUN git pull
RUN npm install --prefix ~/node-bigstream
RUN	mkdir -p /var/bigstream/data
RUN	sed -i 's/127.0.0.1/redis_bigstream/g' ~/node-bigstream/conf/memstore.json
RUN sed -i 's/127.0.0.1/rabbitmq_bigstream/g' ~/node-bigstream/conf/amqp.json
RUN  nodejs /root/node-bigstream/script/install_plugins.js
COPY config.sh .
RUN chmod 755 config.sh
EXPOSE 19980 19080 19180

# start server
ENTRYPOINT 	pm2-docker pm2-default.json
