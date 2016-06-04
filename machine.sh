#!/bin/bash
#
#
#
#
curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine


echo "$(docker-machine version)\n installed"
exit 0
