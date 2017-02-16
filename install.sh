#!/Bin/bash
#
#
#
#
# Just vor your firt install of Docker .

########### Add source files ########
#
#####################################

DISTRIBUTION="ubuntu1604"

. ./${DISTRIBUTION}.sh                # For example Ubuntu 16.04 Distribution
. ./dns-server.sh                     # add dns Servers
. ./docker-compose.sh                 # Installs docker compose 
. ./adjust-memory-swap-accounting.sh  # adjust memory swap
. ./enable-ufw-forwarding.sh
. ./repo/private.sh                   # add private Repo
. ./certs.d/make-cert.sh              # Secure your server installation 
. ./certs.d/make-client-cert.sh       # add cert for you Client
