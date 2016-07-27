#!/bin/bash

# genaral user pnly not the superuser !!!

sudo groupadd docker

NEWUSER="$USER"

echo "Add new User $NEWUSER"

sudo usermod -aG docker $NEWUSER


exit 0
