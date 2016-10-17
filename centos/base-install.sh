#!/bin/bash
# Source : https://docs.docker.com/engine/installation/linux/centos/

# yum update 
sudo yum update

# Add the yum repo 
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

echo "Found Kernel : $(uname -r) "

sudo yum install docker-engine 

# enable docker 
sudo systemctl enable docker.service

# start docker 
sudo service docker start

# Test docker 
sudo docker run --rm hello-world

exit 0 
