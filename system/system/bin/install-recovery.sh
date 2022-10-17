#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:80541a20cf6df9831a7ab4fb613f3bc43d003eac > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:a40cf87de7eb15bcd22e752ebb126e014a7b9ac7 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:80541a20cf6df9831a7ab4fb613f3bc43d003eac >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
