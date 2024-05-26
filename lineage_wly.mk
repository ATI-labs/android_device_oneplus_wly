#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from wly device
$(call inherit-product, device/oneplus/wly/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Rising
PRODUCT_BUILD_PROP_OVERRIDES += \
    RISING_CHIPSET="Snapdragon 8 Gen 1" \
    RISING_MAINTAINER="Arman-ATI"

TARGET_USES_OPLUS_CAMERA := true
TARGET_ENABLE_BLUR := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true

# Gapps
WITH_GMS := true
TARGET_CORE_GMS_EXTRAS := true

# ADB root
ALLOW_ADBD_ROOT := true
ALLOW_LOCAL_PROP_OVERRIDE := true

PRODUCT_NAME := lineage_wly
PRODUCT_DEVICE := wly
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := NE2213

PRODUCT_SYSTEM_NAME := OP516FL1
PRODUCT_SYSTEM_DEVICE := OP516FL1

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="NE2213-user 13 UKQ1.230924.001 S.173e81e-152ed-152ee release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := OnePlus/NE2213/OP516FL1:14/UKQ1.230924.001/S.173e81e-152ed-152ee:user/release-keys
