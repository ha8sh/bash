!#/bin/bash
tee -a /etc/selinux/config > /dev/null <<EOT

SELINUX=disabled
SELINUXTYPE=disabled

EOT
