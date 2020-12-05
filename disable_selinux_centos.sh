
#!/bin/bash

cat << EOF > /etc/selinux/config 

SELINUX=disabled
SELINUXTYPE=disabled

EOF
