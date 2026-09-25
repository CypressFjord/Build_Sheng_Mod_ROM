#! /vendor/bin/sh
cp /data/vendor/rootfs/.dns /data/vendor/rootfs/etc/resolv.conf
echo "nameserver 114.114.114.114" >> /data/vendor/rootfs/etc/resolv.conf

