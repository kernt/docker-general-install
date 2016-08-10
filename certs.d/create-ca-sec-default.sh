#!/bin/bash


# Create a CA, server and client keys with OpenSSL
# First generate CA private and public keys:
openssl genrsa -aes256 -out ca-key.pem 4096

#replace all instances of $HOST in the following example with the DNS name of your Docker daemon’s host.


openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr

# sign the public key with our CA

# ince TLS connections can be made via IP address as well as DNS name, 
# they need to be specified when creating the certificate. For example, to allow connections using 10.10.10.20 and 127.0.0.1:
# replace 10.10.10.20 IP with the ip of your host
echo subjectAltName = IP:10.10.10.20,IP:127.0.0.1 > extfile.cnf

# For client authentication, create a client key and certificate signing request:
openssl genrsa -out key.pem 4096

#To make the key suitable for client authentication, create an extensions config file:
echo extendedKeyUsage = clientAuth > extfile.cnf

#Now sign the public key
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile.cnf

rm -v client.csr server.csr

chmod -v 0400 ca-key.pem key.pem server-key.pem

chmod -v 0444 ca.pem server-cert.pem cert.pem

# Now you can make the Docker daemon only accept connections from clients providing a certificate trusted by our CA:
# docker daemon --tlsverify --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=server-key.pem -H=0.0.0.0:2376

#Secure by default

#If you want to secure your Docker client connections by default, 
#you can move the files to the .docker directory in your home directory -- and set the 
#DOCKER_HOST and DOCKER_TLS_VERIFY variables as well (instead of passing -H=tcp://$HOST:2376 and --tlsverify on every call).

mkdir -pv ~/.docker
cp -v {ca,cert,key}.pem ~/.docker
export DOCKER_HOST=tcp://$HOST:2376 DOCKER_TLS_VERIFY=1
#Docker will now connect securely by default:

docker ps

#Connecting to the secure Docker port using curl
#To use curl to make test API requests, you need to use three extra command line flags:

curl https://$HOST:2376/images/json \
--cert ~/.docker/cert.pem \
--key ~/.docker/key.pem \
--cacert ~/.docker/ca.pem

