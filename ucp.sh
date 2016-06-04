#!/bin/bash
#
#
#
#
##Get the UCP package.
wget https://packages.docker.com/caas/ucp-1.1.1_dtr-2.0.1.tar.gz

##Transfer the package to the offline node.

UCP_HOST=(engine01.docker.vm engine02.docker.vm engine03.docker.vm engine04.docker.vm)

UCP_USER=dockerucp



scp ucp-1.1.1_dtr-2.0.1.tar.gz $USER@$UCP_HOST:/tmp

for ((i = 0; i <= max_index; i++)); do
  echo "Element $i: '${UCP_Host[i]}'"
done
