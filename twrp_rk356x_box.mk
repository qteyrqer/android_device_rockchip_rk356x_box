#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 继承 64 位核心配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# 继承基础电话配置（TV盒子虽无电话，但保留以确保兼容性）
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# [更改] 继承 TWRP 通用配置（原先为 vendor/omni/config/common.mk，已修正为 twrp）
$(call inherit-product, vendor/twrp/config/common.mk)

# 继承设备专属配置
$(call inherit-product, device/rockchip/rk356x_box/device.mk)

PRODUCT_DEVICE := rk356x_box
# [更改] 产品名称由 omni_rk356x_box 统一改为 twrp_rk356x_box
PRODUCT_NAME := twrp_rk356x_box
PRODUCT_BRAND := Dangbei
PRODUCT_MODEL := DBBOX5C
PRODUCT_MANUFACTURER := rockchip

# [删除] 移除 PRODUCT_GMS_CLIENTID_BASE，recovery 构建不需要 GMS Client ID

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="rk356x_box-user 11 RD2A.211001.002 350 release-keys"

BUILD_FINGERPRINT := Dangbei/rk356x_box/rk356x_box:11/RD2A.211001.002/350:user/release-keys