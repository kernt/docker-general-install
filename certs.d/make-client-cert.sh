#!/bin/bash
#
#
#
# source : https://docs.docker.com/engine/security/certificates/
#          https://docs.docker.com/engine/security/https/
#          https://docs.docker.com/engine/security/security/


cd /etc/docker
mkdir certs.d
cd certs.d
mkdir $(hostname)

# Creating the client certificates
openssl genrsa -out client.key 4096
openssl req -new -x509 -text -key client.key -out client.cert
