#!/bin/bash
#
#
#
#

sed -i "s/\#DOCKER_OPTS=\"--dns 8.8.8.8 --dns 8.8.4.4\"/DOCKER_OPTS=\"--dns 8.8.8.8 --dns 8.8.4.4\"/" /etc/default/docker

sudo restart docker

exit 0
