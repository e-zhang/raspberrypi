## commands from cross compiling linux kernel

##  RUN THESE COMMANDS ON THE RPI
##  get hash of the firmware
#  FIRMWARE_HASH=$(zgrep "* firmware as of" /usr/share/doc/raspberrypi-bootloader/changelog.Debian.gz | head -1 | awk '{ print $5 }')
##  get git hash for this kernel
#  KERNEL_HASH=$(wget https://raw.github.com/raspberrypi/firmware/$FIRMWARE_HASH/extra/git_hash -O -)
##  Then replace the git checkout command by this one:
#  git checkout $KERNEL_HASH

## rpi hashes: 
#   - kernel: bc1669c
#   - firmware: 2a329e0 


# crosstool-ng output is /Volumes/rpi-cross/x-tools/arm-unknown-linux-gnueabi

# copy config from rpi
scp raspberrypi:/proc/config.gz .
gzcat config.gz > .config
# generate configs 
make ARCH=arm CROSS_COMPILE=$CCPREFIX HOSTCFLAGS="-I/usr/local/Cellar/libelf/0.8.13_1/include/libelf" oldconfig
# build linux kernel
# this should build the modules.symvers
make ARCH=arm CROSS_COMPILE=$CCPREFIX HOSTCFLAGS="-I/usr/local/Cellar/libelf/0.8.13_1/include/libelf" -j 8
# build modules
# make ARCH=arm CROSS_COMPILE=$CCPREFIX HOSTCFLAGS="-I/usr/local/Cellar/libelf/0.8.13_1/include/libelf" -j 8 modules
