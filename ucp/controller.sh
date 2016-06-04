#!/bin/bash
#
#
UCP_PUBLIC_IP="192.168.4.31 192.168.4.32 192.168.4.33 192.168.4.34"


# for
docker run --rm -it --name ucp  -v /var/run/docker.sock:/var/run/docker.sock docker/ucp install -i --host-address <$UCP_PUBLIC_IP>
