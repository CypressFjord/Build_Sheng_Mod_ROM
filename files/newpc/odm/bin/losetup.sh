#! /vendor/bin/sh
if [[ $1 == "bootup" ]]; then
  usrimg=$(getprop vendor.mslg.mslgusrimg)
  if [[ $usrimg == "/dev/block/loop"* ]]; then
    echo "has already losetup, nothing to do"
    exit 1
  else
    rm -rf /data/vendor/rootfs/tmp/*
    mkdir -p /data/vendor/rootfs/tmp/msl/rdp
    chmod -R 0755 /data/vendor/rootfs/tmp/msl
    dir="/data/vendor/rootfs"
    for file in "$dir"/mslg*; do
      cur_loop=`losetup -f`
      while  [[ $cur_loop != "/dev/block/loop"* ]]
      do
        sleep 1
        cur_loop=`losetup -f`
      done
      losetup -r $cur_loop $file
      setprop vendor.mslg."$(basename "$file")" $cur_loop
    done
    usrimgloop=`losetup -f`
    while  [[ $usrimgloop != "/dev/block/loop"* ]]
    do
      sleep 1
      usrimgloop=`losetup -f`
    done
    losetup -r $usrimgloop /odm/etc/assets/mslgusrimg
    setprop vendor.mslg.mslgusrimg $usrimgloop
  fi
elif [[ $1 == "null" ]]; then
  echo "Process completed, attributes set to null"
  exit 1
else  
  old_loop=$(getprop vendor.mslg.mslg"$1"img)
  if [[ $old_loop == "/dev/block/loop"* ]]; then
    losetup -d $old_loop
  fi
  install_loop=`losetup -f`
  while  [[ $install_loop != "/dev/block/loop"* ]]
  do
    sleep 1
    install_loop=`losetup -f`
  done
  setprop vendor.mslg.optimg.mount /data/vendor/rootfs/opt/"$1"
  losetup -r $install_loop /data/vendor/rootfs/mslg"$1"img
  setprop vendor.mslg.mslg"$1"img $install_loop
  setprop vendor.mslg.loop.mount $install_loop
fi
