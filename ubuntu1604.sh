#!/bin/bash
#
#
sudo apt-get update
sudo apt-get install curl
sudo apt-get install apt-transport-https ca-certificates
curl -fsSL https://get.docker.com/ | sh

sudo groupadd docker
sudo usermod -aG docker $USER
echo "Please give me your non Superuser to work with docker"
sudo read $2USER
sudo usermod -aG docker $2USER


curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


docker run hello-world
