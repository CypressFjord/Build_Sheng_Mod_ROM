#! /vendor/bin/sh
rm -rf /data/vendor/rootfs/home/xiaomi/core
export TMPDIR=/dev/msl/rdp
/vendor/bin/chroot /data/vendor/rootfs /bin/su - root <<EOF
/bin/MSLGd
EOF
