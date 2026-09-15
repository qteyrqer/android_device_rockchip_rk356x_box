#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# [更改] 指向重命名后的 twrp_rk356x_box.mk
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_rk356x_box.mk

# [更改] lunch 选项前缀由 omni_ 统一改为 twrp_
COMMON_LUNCH_CHOICES := \
    twrp_rk356x_box-user \
    twrp_rk356x_box-userdebug \
    twrp_rk356x_box-eng