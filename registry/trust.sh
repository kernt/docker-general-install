#!/bin/bash
#
#
# Source: https://docs.docker.com/engine/security/trust/content_trust/
#         https://docs.docker.com/engine/security/trust/trust_key_mng/
#         
#
# Syntax
# [REGISTRY_HOST[:REGISTRY_PORT]/]REPOSITORY[:TAG]
#export DOCKER_CONTENT_TRUST=1

# not complete visit https://docs.docker.com/engine/security/trust/trust_delegation/
wget https://github.com/docker/notary/releases/download/v0.3.0/notary-Linux-amd64

~/.notary/config.json

{
  "trust_dir" : "~/.docker/trust",
  "remote_server": {
    "url": "https://notary.docker.io"
  }
}

# next Generating delegation keys

# Backup keys
umask 077; tar -zcvf private_keys_backup.tar.gz ~/.docker/trust/private; umask 022
#~/.docker/trust/private



