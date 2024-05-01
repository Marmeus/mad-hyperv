#!/bin/sh

echo 'Setting static IP address for Hyper-V...'

cat << EOF > /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# this was created to eth0 kali will auto start the first interface for vagrant
#The primary network interface
auto eth0
iface eth0 inet static
        address $1
        netmask 255.255.255.0
        broadcast 10.255.255.255
        gateway 10.10.10.1
        dns-nameservers 8.8.8.8
EOF

cat << EOF > /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF