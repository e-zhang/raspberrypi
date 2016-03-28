export PATH=$PATH:/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabihf/bin
# build leptonica first

cd leptonica-1.72
## configure for cross compilation
./configure --host=arm-unknown-linux-gnueabihf --prefix=$PWD/../..//shared/leptonica/leptonica-1.72 --with-sysroot=/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot

make -j8 
make install


# build tesseract
cd tesserat
git checkout 3.04.00
./configure --host=arm-unknown-linux-gnueabihf LIBLEPT_HEADERSDIR=$PWD/../../shared/leptonica/leptonica-1.72/include --with-sysroot=/Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabihf/arm-unknown-linux-gnueabihf/sysroot --with-extra-libraries=$PWD/../..//shared/leptonica/leptonica-1.72/lib --prefix=$PWD/../../shared/tesseract/tesseract-3.04

make -j8
make install
