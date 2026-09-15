#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),rk356x_box)
    # [更改] 使用 all-makefiles-under 递归包含子目录中的 Android.mk
    include $(call all-makefiles-under,$(LOCAL_PATH))
endif