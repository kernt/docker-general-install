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


docker run hello-world
