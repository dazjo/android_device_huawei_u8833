#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit the msm7x27a-common definitions
$(call inherit-product, device/huawei/msm7x27a-common/msm7x27a.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8833/overlay

# Packages
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Files
PRODUCT_COPY_FILES += \
    device/huawei/u8833/rootdir/fstab.huawei:root/fstab.huawei \
    device/huawei/u8833/rootdir/init.device.rc:root/init.device.rc \
    device/huawei/u8833/rootdir/1191601.img:root/tp/1191601.img

PRODUCT_COPY_FILES += \
    device/huawei/u8833/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/u8833/configs/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/huawei/u8833/configs/thermald.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
    device/huawei/u8833/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/huawei/u8833/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/huawei/u8833/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/huawei/u8833/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    device/huawei/u8833/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.confg.hw_appfsversion=U8833V4_4_SYSIMG \
    ro.confg.hw_appsbootversion=U8833V4_4_APPSBOOT \
    ro.confg.hw_appversion=U8833V4_4_KERNEL

PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.analogpath.supported=false \
    ro.fm.transmitter=false \
    ro.fm.mulinst.recording.support=false

PRODUCT_PROPERTY_OVERRIDES += \
    gsm.version.baseband=2030 \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ro.telephony.ril.v3=qcomdsds,skippinpukcount \
    ro.telephony.ril_class=HuaweiQualcommRIL

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, vendor/huawei/u8833/u8833-vendor.mk)
