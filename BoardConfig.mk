#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8450-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/wly

# Display
TARGET_SCREEN_DENSITY := 420

# Prebuilt kernel
ifeq ($(strip $(PREBUILT_KERNEL)),true)
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_KERNEL_BINARIES := kernel
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel
INLINE_KERNEL_BUILDING := true
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/system_dlkm/,$(TARGET_COPY_OUT_SYSTEM_DLKM)/lib/modules/5.10.223-Arman-ATI-Stable-priv-ksu-V3.8/3bff6343) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor_dlkm/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor_ramdisk/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules)
else
# DTB/O
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
TARGET_KERNEL_CONFIG += vendor/oplus/wly.config
endif

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Include the proprietary files BoardConfig.
include vendor/oneplus/wly/BoardConfigVendor.mk
