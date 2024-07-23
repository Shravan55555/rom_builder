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
lunch aosp_RMX1901-ap2a-userdebug
make bacon -j$(nproc --all) &
sleep 97m
kill %1
ccache -s
