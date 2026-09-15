#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 物理目录名保持不变，仍为 rk356x_box
DEVICE_PATH := device/rockchip/rk356x_box

# 允许缺少依赖，便于 TWRP 最小化构建
ALLOW_MISSING_DEPENDENCIES := true

# [更改] 架构：RK3566 为 4 核 Cortex-A55，将 TARGET_CPU_VARIANT 由 generic 改为 cortex-a55
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# [更改] Bootloader 名称由 rk30sdk 修正为 rk356x
TARGET_BOOTLOADER_BOARD_NAME := rk356x
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 240

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x10000000
# [更改] 简化内核 cmdline，移除不必要的 buildvariant=user，保留 recovery 必需参数
BOARD_KERNEL_CMDLINE := console=ttyFIQ0 androidboot.baseband=N/A androidboot.wificountrycode=CN androidboot.veritymode=enforcing androidboot.hardware=rk30board androidboot.console=ttyFIQ0 androidboot.verifiedbootstate=orange firmware_class.path=/vendor/etc/firmware init=/init rootwait ro loop.max_part=7 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := rk356x_box_defconfig
TARGET_KERNEL_SOURCE := kernel/rockchip/rk356x_box

# Kernel - prebuilt（根据实际 prebuilt 目录结构配置）
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
    TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
    TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
    BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
    # [更改] 保留 DTB 嵌入 boot.img，不再清空
    BOARD_INCLUDE_DTB_IN_BOOTIMG := true
    # [更改] 保留独立 DTBO 分区，并指向预编译 dtbo.img
    BOARD_KERNEL_SEPARATED_DTBO := true
    BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072

# [更改] 根据 parameter.txt 精确计算分区大小
# boot 分区：0x00019000 扇区 × 512 = 52,428,800 字节
BOARD_BOOTIMAGE_PARTITION_SIZE := 52428800
# recovery 分区：0x00030000 扇区 × 512 = 100,663,296 字节
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# [更改] 根据 parameter.txt 修正 super 分区大小（0x00614000 × 512 = 3,263,168,512）
BOARD_SUPER_PARTITION_SIZE := 3263168512
BOARD_SUPER_PARTITION_GROUPS := rockchip_dynamic_partitions
BOARD_ROCKCHIP_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product odm
# 通常为 super 大小减去 4MB 元数据
BOARD_ROCKCHIP_DYNAMIC_PARTITIONS_SIZE := 3258974208

# Platform
TARGET_BOARD_PLATFORM := rk356x

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# [更改] 显式指定 TWRP 使用的 fstab 文件路径
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Security patch level（防止 anti-rollback）
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
# [更改] 电视盒子通常为横屏，将 portrait_hdpi 改为 landscape_hdpi
TW_THEME := landscape_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
# [删除] 移除不适用的 TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true