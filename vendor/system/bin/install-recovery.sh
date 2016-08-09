#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9123840 e4e7c7e09cc0a5b480592393a376d3350879af30 6373376 c3dbfe4b190dbbdf51c1f2a3509c108f921c5dfe
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:9123840:e4e7c7e09cc0a5b480592393a376d3350879af30; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6373376:c3dbfe4b190dbbdf51c1f2a3509c108f921c5dfe EMMC:/dev/block/bootdevice/by-name/recovery e4e7c7e09cc0a5b480592393a376d3350879af30 9123840 c3dbfe4b190dbbdf51c1f2a3509c108f921c5dfe:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
