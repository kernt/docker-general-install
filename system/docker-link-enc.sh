#!/bin/bash
#
# Source= https://docs.docker.com/compose/link-env-deprecated/
#
#
#
name="$1"

$name_PORT
Full URL, e.g. DB_PORT=tcp://172.17.0.5:5432

$name_PORT_num_protocol
Full URL, e.g. DB_PORT_5432_TCP=tcp://172.17.0.5:5432

$name_PORT_num_protocol_ADDR
Container’s IP address, e.g. DB_PORT_5432_TCP_ADDR=172.17.0.5

$name_PORT_num_protocol_PORT
Exposed port number, e.g. DB_PORT_5432_TCP_PORT=5432

$name_PORT_num_protocol_PROTO
Protocol (tcp or udp), e.g. DB_PORT_5432_TCP_PROTO=tcp

$name_NAME
Fully qualified container name, e.g. DB_1_NAME=/myapp_web_1/myapp_db_1
