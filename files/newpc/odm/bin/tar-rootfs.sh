#! /vendor/bin/sh
if [ -e "/data/vendor/rootfs/home/xiaomi/.config/Kingsoft/Office.conf" ]; then
mv /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/Office.conf /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/Office.conf_used
fi
if [ -e "/data/vendor/rootfs/home/xiaomi/.config/Kingsoft/WPSCloud.conf" ]; then
mv /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/WPSCloud.conf /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/WPSCloud.conf_used
fi

tar -xvf  /odm/etc/assets/$1 -C /data/vendor/rootfs

if [ -e "/data/vendor/rootfs/home/xiaomi/.config/Kingsoft/Office.conf_used" ]; then
mv /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/Office.conf_used /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/Office.conf
fi
if [ -e "/data/vendor/rootfs/home/xiaomi/.config/Kingsoft/WPSCloud.conf_used" ]; then
mv /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/WPSCloud.conf_used /data/vendor/rootfs/home/xiaomi/.config/Kingsoft/WPSCloud.conf
fi

if [ -e "/data/vendor/rootfs/etc/hosts" ]; then
echo "127.0.0.1 localhost" > /data/vendor/rootfs/etc/hosts
fi

if [ -e "/data/vendor/rootfs/etc/resolv.conf" ]; then
echo "nameserver 114.114.114.114" > /data/vendor/rootfs/etc/resolv.conf
fi

setprop persist.vendor.unzip.mslgrootfs disable
