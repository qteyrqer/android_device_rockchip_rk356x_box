#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/rockchip/rk356x_box

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
# [保留] Rockchip BSP 通用板名，与 init.rk30board.rc 等脚本文件名匹配，不要改
TARGET_BOOTLOADER_BOARD_NAME := rk30sdk
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 240

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x10000000

# [保留] androidboot.hardware=rk30board 是 Rockchip 产品线统一使用的硬件标识，不要改
BOARD_KERNEL_CMDLINE := console=ttyFIQ0 androidboot.baseband=N/A androidboot.wificountrycode=CN androidboot.veritymode=enforcing androidboot.hardware=rk30board androidboot.console=ttyFIQ0 androidboot.verifiedbootstate=orange firmware_class.path=/vendor/etc/firmware init=/init rootwait ro loop.max_part=7 androidboot.selinux=permissive buildvariant=user

BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := rk356x_box_defconfig
TARGET_KERNEL_SOURCE := kernel/rockchip/rk356x_box

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# [修改] 根据 parameter.txt：boot = 0x00019000 扇区 = 52428800 字节 (50MiB)
BOARD_BOOTIMAGE_PARTITION_SIZE := 52428800

# [修改] 根据 parameter.txt：recovery = 0x00030000 扇区 = 100663296 字节 (96MiB)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# [修改] 根据 parameter.txt：super = 0x00614000 扇区 = 3263168512 字节 (约 3.04GiB)
BOARD_SUPER_PARTITION_SIZE := 3263168512
BOARD_SUPER_PARTITION_GROUPS := rockchip_dynamic_partitions

# [修改] 根据实际设备动态分区列表填写；如果还有 cust/custom 等分区，请一并加入
BOARD_ROCKCHIP_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm system_ext

# [修改] super 大小减去 4MiB 元数据开销：3263168512 - 4194304 = 3258974208
BOARD_ROCKCHIP_DYNAMIC_PARTITIONS_SIZE := 3258974208

# Platform
TARGET_BOARD_PLATFORM := rk356x

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# [新增] 根据 Rockchip TWRP 社区反馈，misc 分区 bootloader message 偏移量为 16384
BOARD_RECOVERY_BLDRMSG_OFFSET := 16384

# Security patch level
# [修改] 删除重复的 VENDOR_SECURITY_PATCH 声明，保留下方防回滚值即可
# VENDOR_SECURITY_PATCH := 2021-08-01

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
# [修改] 电视盒子推荐使用横屏主题
TW_THEME := landscape_hdpi
TW_EXTRA_LANGUAGES := true

# [修改] 电视盒子建议关闭启动黑屏
TW_SCREEN_BLANK_ON_BOOT := false

# [修改] 禁止屏幕超时
TW_NO_SCREEN_TIMEOUT := true

TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true