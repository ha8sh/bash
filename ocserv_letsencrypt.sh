#!/bin/bash
read -r -p "Enter your Mail: " MAIL
read -r -p "Enter your Domain: " DOMAIN

certbot certonly --standalone --preferred-challenges http --agree-tos --email $MAIL -d $DOMAIN

sed -i -e 's/'server-cert'/'#server-cert'/g' /etc/ocserv/ocserv.conf
sed -i -e 's/'server-key'/'#server-key'/g' /etc/ocserv/ocserv.conf

cat << EOF >> /etc/ocserv/ocserv.conf
server-cert = /etc/letsencrypt/live/$DOMAIN/fullchain.pem
server-key = /etc/letsencrypt/live/$DOMAIN/privkey.pem
EOF

hostnamectl set-hostname $DOMAIN
systemctl restart ocserv
