#!/bin/bash

curl -OL https://go.dev/dl/go1.25.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.25.1.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
export HOME="/tmp/home"
export GOPATH="/tmp/go"
export GOMODPATH="/tmp/go/pkg/mod"
export GOCACHE="/tmp/go/cache"

###############
# Setup Redis #
###############

apt-get install lsb-release curl gpg
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
apt-get update
apt-get -y install redis

# Configure Redis
echo "bind * -::*" >> /etc/redis/redis.conf
echo "requirepass ${redis_password}" >> /etc/redis/redis.conf

# Restart Redis server
/etc/init.d/redis-server restart

###################
# Setup Terramino #
###################

cd ~
git clone https://github.com/hashicorp-education/terraform-aws-terramino-redis.git
cd terraform-aws-terramino-redis/terramino-go

# Temporarily checkout a previous version of terramino-go
git checkout 58d39908e07424cba3b0c2f2d9588d9cebfa476b

APP_NAME=${app_name} TERRAMINO_PORT=${port} go run main.go
