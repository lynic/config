#!/bin/bash

sudo systemctl start rabbitmq-server.service
sudo systemctl start openvswitch.service
sudo systemctl start mariadb.service
sudo systemctl start ipsec.service
sudo systemctl start httpd.service
sudo losetup -f /opt/stack/data/stack-volumes-lvmdriver-1-backing-file
sudo losetup -f /opt/stack/data/stack-volumes-default
sudo losetup -f /opt/stack/data/stack-volumes-default-backing-file
sudo ifconfig br-ex 172.24.4.1/24 up
sudo ifconfig br-phy up
sudo ifconfig br-int up
sudo iptables -t nat -D POSTROUTING -s 172.24.4.2 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -s 172.24.4.2 -j MASQUERADE
sudo iptables -D FORWARD -s 172.24.4.0/24 -j ACCEPT
sudo iptables -I FORWARD -s 172.24.4.0/24 -j ACCEPT
sudo iptables -D FORWARD -d 172.24.4.0/24 -j ACCEPT
sudo iptables -I FORWARD -d 172.24.4.0/24 -j ACCEPT
sudo ip route add 10.0.0.0/24 via 172.24.4.2 dev br-ex
/home/elynn/source/devstack/rejoin-stack.sh
