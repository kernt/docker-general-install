#!/bin/bash
#
HOSTNAME=""
PORT="5000"
REPO=""
IMG=""
$HOSTNAME:$PORT/$REPO/$IMG

# note: registry works only with ssl !!
docker run -p $PORT:$PORT registry

# For your environment you can use this example only.
# run your docker deamon with ---insecure-registry "$HOSTNAME:$PORT"

exit 0
