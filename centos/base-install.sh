#!/bin/bash
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

sudo yum install docker-engine

udo docker run hello-world

sudo yum update

curl -fsSL https://get.docker.com/ | sh


sudo service docker start

docker run hello-world

sudo chkconfig docker on

