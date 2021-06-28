#!/bin/bash
cd /etc/yum.repos.d
mkdir OldRepo
mv *.repo OldRepo
wget https://git.io/JIGuO -O CentOS-Vault.repo
yum clean all
yum remove epel-release -y
wget -O /tmp/epel-release-6-8.noarch.rpm https://vault.centos.org/6.10/extras/x86_64/Packages/epel-release-6-8.noarch.rpm
rpm -Uvh /tmp/epel-release-6-8.noarch.rpm
yum update
