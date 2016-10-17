# docker-general-install
short install for your distribution. Like the doc from docker page.

# Systemd /systemd 

 	docker-tcp.socket 	for connections over Docker Remote API Port 2375
	docker.service 	        Starts the docker Process.
	docker.socket 	        Unix Socket.
	
# Centos installation
/centos/base-install.sh script is installing just the docker binary itself.
You have to execute the base-install.sh script after that you can execute your firt trys with docker .

# Docker shares
/var/lib/docker/volumes/$IMGID/_data = contains the data for local use only
for example
- volume: /var/log/privacyidea -> /var/lib/docker/volumes/e58282bad512a85a84e77ce08d96467b64327c46b857843285914d8233a4741d/_data

/srv/docker/$IDNAME/$SERVICENAME     = contains shares for Global use there $SERVICENAME is the name of the working direcktory of the service himself.

for example
- volume: /teampass -> /srv/docker/teampass


# Docker security
Look for a better anderstanding at the folloimg sources :
* https://docs.docker.com/engine/security/https/

By default a private repository are only usable with tls encryption butt you can deactivate that.
Buttt than your repository is open for erveryone in the world that can be not your goal.
To proteckt your repo you must have a certificate and so on.
Hiere a list wiht all your needs:

* a private Repository
* a Certificate for your node 
* remote api must activateted

