## build commands for librekinect
# using cross compile tools from /Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi
make ARCH=arm CROSS_COMPILE=/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi- ARMKDIR=../linux KERNELDIR=../linux 

## libudev downloaded from deb package manager
## build commands for libusb 
./configure --host=arm-unknown-linux-gnueabi --prefix=/Volumes/rpi-cross/shared/libusb/libusb-1.0.20 --with-sysroot=/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot CPPFLAGS=-I/Volumes/rpi-cross/shared/libudev/libudev-215/include LDFLAGS=-L/Volumes/rpi-cross/shared/libudev/libudev-215/lib

make -j8 && make install

## build commands for libfreenect 
cmake -DCMAKE_TOOLCHAIN_FILE=arm-gnueabi.toolchain.cmake -DCMAKE_INSTALL_PREFIX=/Volumes/rpi-cross/shared/libfreenect/libfreenect-0.5.3/ -DBUILD_EXAMPLES=OFF -DBUILD_FAKENECT=OFF -DLIBUSB_1_INCLUDE_DIR=/Volumes/rpi-cross/shared/libusb/libusb-1.0.20/include/libusb-1.0 -DLIBUSB_1_LIBRARY=/Volumes/rpi-cross/shared/libusb/libusb-1.0.20/lib/libusb-1.0.so ../
