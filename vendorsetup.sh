echo "Starting to clone stuffs needed to build for Haydn"

# Common device tree (chipset tree)
if [ ! -d device/xiaomi/sm8350-common ]; then
   git clone --depth=1 https://github.com/Asimplayz1/device-xiaomi-sm8350 -b lineage-22 device/xiaomi/sm8350-common
fi

# Kernel
if [ ! -d kernel/xiaomi/sm8350 ]; then
   git clone --depth=1 https://github.com/Asimplayz1/kernel-xiaomi-sm8350 --recursive -b Kernelicious kernel/xiaomi/sm8350
fi

# Main vendor tree
if [ ! -d vendor/xiaomi/haydn ]; then
   git clone --depth=1 https://github.com/Asimplayz1/vendor-xiaomi-haydn -b 15 vendor/xiaomi/haydn
fi

# Common vendor tree
if [ ! -d vendor/xiaomi/sm8350-common ]; then
   git clone --depth=1 https://github.com/Asimplayz1/vendor-xiaomi-sm8350 -b 15 vendor/xiaomi/sm8350-common
fi

# Firmware setup
if [ ! -d vendor/xiaomi/haydn-firmware ]; then
   git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware.git -b fourteen vendor/xiaomi/haydn-firmware
fi

# Xiaomi Leica Camera
if [ ! -d vendor/xiaomi/haydn-miuicamera ]; then
   git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera.git -b fourteen-leica vendor/xiaomi/haydn-miuicamera
fi

# Dolby
if [ ! -d hardware/dolby ]; then
   git clone --depth=1 https://github.com/Asimplayz1/hardware_dolby -b 15 hardware/dolby
fi

# BCR (Basic Call Recorder)
if [ ! -d vendor/bcr ]; then
   git clone --depth=1 https://github.com/Chaitanyakm/vendor_bcr -b main vendor/bcr
fi

# Xiaomi hardware tree
if [ ! -d hardware/xiaomi/* ]; then
   git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
fi

# Signed build
if [ ! -d vendor/lineage-priv/* ]; then
   curl -sSf https://raw.githubusercontent.com/Trijal08/crDroid-build-signed-script-auto/main/create-signed-env.sh | bash
fi

echo "Delete vendorsetup.sh from device tree once this is done."
