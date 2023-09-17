#!/bin/bash
cd ~/rom

. build/envsetup.sh
export TZ=Asia/Jakarta
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 50G -F 0
ccache -o compression=true
ccache -z
export BUILD_USERNAME="SSK"
export BUILD_HOSTNAME="SSK"
export WITHOUT_CHECK_API=true
lunch lineage_RMX1901-userdebug
mka nad -j8
