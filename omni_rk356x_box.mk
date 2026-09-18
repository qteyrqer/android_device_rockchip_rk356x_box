#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from rk356x_box device
$(call inherit-product, device/rockchip/rk356x_box/device.mk)

PRODUCT_DEVICE := rk356x_box
PRODUCT_NAME := omni_rk356x_box
PRODUCT_BRAND := Dangbei
PRODUCT_MODEL := DBBOX5C
PRODUCT_MANUFACTURER := rockchip

PRODUCT_GMS_CLIENTID_BASE := android-rockchip-tv

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="rk356x_box-user 11 RD2A.211001.002 350 release-keys"

BUILD_FINGERPRINT := Dangbei/rk356x_box/rk356x_box:11/RD2A.211001.002/350:user/release-keys
