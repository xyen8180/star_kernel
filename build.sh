#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp -b twrp-11"


DEVICE=star
DT_LINK="https://github.com/xyen8180/test-tree -b aosp"
DT_PATH=device/xiaomi/$DEVICE
SD_LINK="https://github.com/xyen8180/android_device_xiaomi_sm8350-common -b aosp"
SD_PATH="device/xiaomi/sm8350-common"
echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir android-kernel && cd android-kernel

echo " ===+++ Syncing Recovery Sources +++==="
echo " ===+++ Cloning Manifest  +++==="
repo init -u https://android.googlesource.com/kernel/manifest -b common-android11-5.4
repo sync
git clone https://github.com/nebrassy/kernel_xiaomi_sm8350 -b android-11-backup kernel/xiaomi/sm8350/
BUILD_CONFIG=kernel/xiaomi/sm8350/build.config.gki.aarch64 build/build.sh

