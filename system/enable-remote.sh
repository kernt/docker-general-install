#!/bin/bash
#
#
#
#
#
cp docker-tcp.socket /lib/systemd/system/docker-tcp.socket

systemctl enable docker-tcp.socket
systemctl stop docker
systemctl start docker-tcp.socket


exit 0
