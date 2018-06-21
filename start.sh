#!/bin/bash

# docker虚拟机启动时运行

# 1. 启动ssh进程
# 2. 在hosts文件中添加其他主机的信息


/usr/sbin/sshd



# 此处添加docker集群的ip和hostname

# echo 172.18.0.81 master >> /etc/hosts
# echo 172.18.0.82 slave1 >> /etc/hosts
# echo 172.18.0.83 slave2 >> /etc/hosts
# echo 172.18.0.84 slave3 >> /etc/hosts

if ! grep -q master /etc/hosts 
then
	echo 172.18.0.81	master >> /etc/hosts
fi
if ! grep -q slave1 /etc/hosts 
then
	echo 172.18.0.82	slave1 >> /etc/hosts
fi
if ! grep -q slave2 /etc/hosts 
then
	echo 172.18.0.83	slave2 >> /etc/hosts
fi
if ! grep -q slave3 /etc/hosts 
then
	echo 172.18.0.84	slave3 >> /etc/hosts
fi
