#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/rockchip/rk356x_box

# [新增] 将 recovery/root 目录下的 init 文件拷贝到 recovery 镜像中
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.rk30board.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.rk30board.rc