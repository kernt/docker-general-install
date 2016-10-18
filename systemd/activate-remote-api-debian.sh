#!/bin/bash
#
#
#

cp ./docker-tcp.socket /etc/systemd/system/

systemctl enable docker-tcp.socket
systemctl stop docker
systemctl start docker-tcp.socket

exit 0
