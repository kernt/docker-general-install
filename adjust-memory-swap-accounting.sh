#!/bin/bash
#
sed -i "s/GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"cgroup_enable=memory swapaccount=1\"/" /etc/default/grub
sudo update-grub

exit 0
