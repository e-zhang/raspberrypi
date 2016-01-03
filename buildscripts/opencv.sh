
# set jpeg and jasper to prevent cmake from finding host libs
 cmake -DCMAKE_TOOLCHAIN_FILE=../platforms/linux/arm-gnueabi.toolchain.cmake -DCMAKE_INSTALL_PREFIX=/Volumes/rpi-cross/shared/opencv/opencv-3.1/ -DBUILD_ZLIB=ON -DBUILD_JPEG=ON -DBUILD_JASPER=ON ../  > cmake.out

make -j8 
make install
