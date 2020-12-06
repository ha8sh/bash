#!/bin/bash
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Tehran /etc/localtime
cat << EOF > /var/spool/cron/root
30 5 * * * root reboot >/dev/null 2>&1
EOF
echo "Please Wait"
sleep 3
echo "Done"
