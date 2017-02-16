Configuring CoreOS
==================

We need to tweak the default docker.service definition in CoreOS to use the TLS certs we created. This should be done as root. 
The below script assumes the server certificates are in working directory of the script.
