#!/bin/bash

curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# Links 
# Linux bin file 
#https://github.com/docker/compose/releases/download/1.7.1/docker-compose-Linux-x86_64
# Linux run script
# https://github.com/docker/compose/releases/download/1.7.1/run.sh

docker-compose --version

