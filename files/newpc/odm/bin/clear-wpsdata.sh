#! /vendor/bin/sh
rm -rf /data/vendor/rootfs/home/xiaomi/.local/share/Kingsoft
rm -rf /data/vendor/rootfs/home/xiaomi/.config/Kingsoft
cp -rf /data/vendor/rootfs/root/.config/Kingsoft /data/vendor/rootfs/home/xiaomi/.config/
chmod -R 770 /data/vendor/rootfs/home/xiaomi/.config/Kingsoft
chown product_hyperengine:root  /data/vendor/rootfs/home/xiaomi/.config/Kingsoft -R
