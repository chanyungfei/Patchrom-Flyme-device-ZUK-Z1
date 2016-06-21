#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9148416 860cc92a6daf65f901aa9c96ae2aa10fff7c8cf9 6397952 daf65d79ef32c3f9233cdc9ca5cfd08554afa733
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:9148416:860cc92a6daf65f901aa9c96ae2aa10fff7c8cf9; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6397952:daf65d79ef32c3f9233cdc9ca5cfd08554afa733 EMMC:/dev/block/bootdevice/by-name/recovery 860cc92a6daf65f901aa9c96ae2aa10fff7c8cf9 9148416 daf65d79ef32c3f9233cdc9ca5cfd08554afa733:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
