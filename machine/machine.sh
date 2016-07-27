#!/bin/bash
#
#
#
#

curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine


echo "$(docker-machine version)\n installed"
#Installing bash completion scripts

COMPLITION_ENV(
 https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash
 https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash
 https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash
 )

for ((i = 0; i <= max_index; i++)); do
  echo "Element $i: '${COMPLITION_ENV[i]}'"
done
 
docker-machine version

exit 0
