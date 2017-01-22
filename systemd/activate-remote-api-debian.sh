#!/bin/bash
#
#
#

cp ./docker-tcp.socket /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable docker-tcp.socket
sudo systemctl stop docker
sudo systemctl start docker-tcp.socket

exit 0
