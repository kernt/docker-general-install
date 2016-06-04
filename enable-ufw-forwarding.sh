#!/bin/bash
#
#
#
#
sudo ufw status

echo "saved /etc/default/ufw to /var/backups/"
cp /etc/default/ufw /var/backups/
sed  -i "s/DEFAULT_FORWARD_POLICY=\"DROP\"/DEFAULT_FORWARD_POLICY=\"ACCEPT\"/" /etc/default/ufw


sudo ufw reload
sudo ufw allow 2375/tcp


exit 0
