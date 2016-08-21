# docker-general-install
short install for your distribution. Like the doc from docker page.

# Systemd /systemd 

 	docker-tcp.socket 	for connections over Docker Remote API Port 2375
	docker.service 	        Starts the docker Process.
	docker.socket 	        Unix Socket.
	
# Centos installation
/centos

execute the base-install.sh script.

# Docker shares

/var/lib/docker/volumes/$IMGID/_data = contains the data for local use only
for example
- volume: /var/log/privacyidea -> /var/lib/docker/volumes/e58282bad512a85a84e77ce08d96467b64327c46b857843285914d8233a4741d/_data

/srv/docker/$IDNAME/$SERVICENAME     = contains shares for Global use there $SERVICENAME is the name of the working direcktory of the service himself.

for example
- volume: /teampass -> /srv/docker/teampass
