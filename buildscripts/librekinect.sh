## build commands for librekinect

# using cross compile tools from /Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi
make ARCH=arm CROSS_COMPILE=/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi- ARMKDIR=../linux KERNELDIR=../linux 

