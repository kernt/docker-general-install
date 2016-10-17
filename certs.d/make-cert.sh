#!/bin/bash
#
# Source  : https://docs.docker.com/engine/security/https/
# 
# 

# First generate CA private and public keys:
openssl genrsa -aes256 -out ca-key.pem 4096

# maybe a litle be longer -days 999
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem


# Make sure that “Common Name” (i.e., server FQDN or YOUR name) matches the hostname you will use to connect to Docker:
openssl genrsa -out server-key.pem 4096

openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr

# Next, we’re going to sign the public key with our CA:
# Since TLS connections can be made via IP address as well as DNS name, 
# they need to be specified when creating the certificate. For example, to allow connections using 10.10.10.20 and 127.0.0.1:
# 
echo subjectAltName = IP:10.10.10.20,IP:127.0.0.1 > extfile.cnf

openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out server-cert.pem -extfile extfile.cnf

# For client authentication, create a client key and certificate signing request:
openssl genrsa -out key.pem 4096

openssl req -subj '/CN=client' -new -key key.pem -out client.csr

# To make the key suitable for client authentication, create an extensions config file:
echo extendedKeyUsage = clientAuth > extfile.cnf

# Now sign the public key: 
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out cert.pem -extfile extfile.cnf

# After generating cert.pem and server-cert.pem you can safely remove the two certificate signing requests:
rm -v client.csr server.csr

#With a default umask of 022, your secret keys will be world-readable and writable for you and your group.
#In order to protect your keys from accidental damage, you will want to remove their write permissions. 
#To make them only readable by you, change file modes as follows:

chmod -v 0400 ca-key.pem key.pem server-key.pem

# Certificates can be world-readable, but you might want to remove write access to prevent accidental damage:
chmod -v 0444 ca.pem server-cert.pem cert.pem


echo " Now you can make the Docker daemon only accept connections from clients providing a certificate trusted by our CA: "
echo " docker --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem \
  -H=$HOST:2376 version "
