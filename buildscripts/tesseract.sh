# build leptonica first

cd leptonica-1.72
## configure for cross compilation
./configure --host=arm-unknown-linux-gnueabi --prefix=/Volumes/rpi-cross/shared/leptonica/leptonica-1.72 --with-sysroot=/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot

make -j8 
make install


# build tesseract
cd tesserat
git checkout 3.04.00
./configure --host=arm-unknown-linux-gnueabi LIBLEPT_HEADERSDIR=/Volumes/rpi-cross/shared/leptonica/leptonica-1.72/include --with-sysroot=/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot --with-extra-libraries=/Volumes/rpi-cross/shared/leptonica/leptonica-1.72/lib --prefix=/Volumes/rpi-cross/shared/tesseract/tesseract-3.04

make -j8
make install
