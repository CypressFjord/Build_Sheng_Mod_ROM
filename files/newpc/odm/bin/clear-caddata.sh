#! /vendor/bin/sh
rm -rf /data/vendor/rootfs/home/xiaomi/.local/share/ZWSOFT
rm -rf /data/vendor/rootfs/home/xiaomi/.local/share/ZWCAD
rm -rf /data/vendor/rootfs/home/xiaomi/.config/ZWSOFT
cp -rf /data/vendor/rootfs/root/.config/ZWSOFT /data/vendor/rootfs/home/xiaomi/.config/
chmod -R 770 /data/vendor/rootfs/home/xiaomi/.config/ZWSOFT
chown product_hyperengine:root  /data/vendor/rootfs/home/xiaomi/.config/ZWSOFT -R
