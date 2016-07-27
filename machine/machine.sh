#!/bin/bash
#
#
#
# Source: 

curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine


#/etc/bash_completion.d

# To enable the docker-machine shell prompt
# is corently not working . 
#PS1='[\u@\h \W$(__docker_machine_ps1)]\$ ' >> ~/.bashrc

echo "$(docker-machine version)\n installed"
#Installing bash completion scripts

COMPLITION=( "https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash" "https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash" "https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash" )

for i in "${COMPLITION[@]}"
 do
     wget  $i
 done


 
docker-machine version

exit 0
