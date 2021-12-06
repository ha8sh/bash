#!/bin/bash
echo duplicate-cn >> /etc/openvpn/serverudp.conf
echo duplicate-cn >> /etc/openvpn/servertcp.conf
systemctl restart openvpnudp
systemctl restart openvpntcp
