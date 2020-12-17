#!/bin/bash
yum install epel-release -y ; yum install nano wget net-tools htop nload openvpn firewalld -y

setenforce 0

cat << EOF> /etc/systemd/system/openvpntcp.service

[Unit]
Description=OpenVPN Robust And Highly Flexible Tunneling Application On %I
After=syslog.target network.target

[Service]
Type=forking
PrivateTmp=true
ExecStart=/usr/sbin/openvpn --daemon --cd /etc/openvpn/ --config /etc/openvpn/servertcp.conf --writepid /var/run/openvpn_tcp.pid

[Install]
WantedBy=multi-user.target

EOF

cat << EOF> /etc/systemd/system/openvpnudp.service

[Unit]
Description=OpenVPN Robust And Highly Flexible Tunneling Application On %I
After=syslog.target network.target

[Service]
Type=forking
PrivateTmp=true
ExecStart=/usr/sbin/openvpn --daemon --cd /etc/openvpn/ --config /etc/openvpn/serverudp.conf --writepid /var/run/openvpn_udp.pid

[Install]
WantedBy=multi-user.target

EOF


echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.proxy_arp = 1" >> /etc/sysctl.conf
sysctl -p 


cat << EOF > /etc/selinux/config 
SELINUX=disabled
SELINUXTYPE=disabled
EOF


systemctl daemon-reload
systemctl enable openvpntcp --now
systemctl enable openvpnudp --now
systemctl enable firewalld --now




