#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:3e48d96767bec8d07dcbf02e77ed7aa9cb1a0265; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:67108864:4a615cb727c954532cd065e0e3324b55cf86b47f \
          --target EMMC:/dev/block/by-name/recovery:134217728:3e48d96767bec8d07dcbf02e77ed7aa9cb1a0265 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
