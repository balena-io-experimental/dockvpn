#!/bin/sh
set -e

[ -d /dev/net ] ||
	mkdir -p /dev/net
[ -c /dev/net/tun ] ||
	mknod /dev/net/tun c 10 200

#iptables -t nat -A POSTROUTING -s 192.168.255.0/24 -o eth0 -j MASQUERADE

while true ; do openvpn --writepid openvpn-server.pid --config server.conf ; done &

tail -F *.log
