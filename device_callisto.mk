# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.


# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.


DEVICE_PACKAGE_OVERLAYS := device/samsung/callisto/overlays


PRODUCT_PACKAGES += \
    brcm_patchram_plus \
    copybit.callisto \
    gps.callisto \
    gralloc.callisto \
    libOmxCore \
    libOmxVidEnc \
    lights.msm7k \
    rzscontrol \
    screencap \
    setup_fs

# Recovery tools
PRODUCT_PACKAGES += \
    flash_image \
    dump_image \
    erase_image \
    make_ext4fs \
    e2fsck
    
# Service Mode Secret Code
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Kernel modules - normal
PRODUCT_COPY_FILES += \
    device/samsung/callisto/Kernel/ueventd.gt-i5510.rc:root/ueventd.gt-i5510.rc \
    device/samsung/callisto/Kernel/init.gt-i5510.rc:root/init.gt-i5510.rc \
    device/samsung/callisto/Kernel//CALLISTO.rle:root/CALLISTO.rle \
    device/samsung/callisto/Kernel/lib/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/callisto/Kernel/lib/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/callisto/Kernel/lib/modules/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    device/samsung/callisto/Kernel/lib/modules/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    device/samsung/callisto/Kernel/lib/modules/acc_cal_param.ko:system/lib/modules/acc_cal_param.ko \
    device/samsung/callisto/Kernel/lib/modules/sec_param.ko:system/lib/modules/sec_param.ko \
    device/samsung/callisto/Kernel/lib/modules/tun.ko:root/lib/modules/tun.ko \
    device/samsung/callisto/files/bin/mad2sd:root/sbin/mad2sd \

   # device/samsung/callisto/Kernel/lib/modules/zram.ko:system/lib/modules/zram.ko

# Kernel modules - recovery
PRODUCT_COPY_FILES += \
    device/samsung/callisto/Kernel/ueventd.gt-i5510.rc:root/ueventd.gt-i5510.rc \
    device/samsung/callisto/Kernel/init.gt-i5510.rc:root/init.gt-i5510.rc \
    device/samsung/callisto/Kernel/CALLISTO.rle:recovery/root/CALLISTO.rle \
    device/samsung/callisto/Recovery/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/callisto/Recovery/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/callisto/Recovery/modules/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    device/samsung/callisto/Recovery/modules/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    device/samsung/callisto/Recovery/recovery.fstab_full:recovery/root/etc/recovery.fstab \

# Device-specific keymaps
PRODUCT_COPY_FILES += \
	device/samsung/callisto/files/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/callisto/files/usr/keylayout/callisto_headset.kl:system/usr/keylayout/callisto_headset.kl \
	device/samsung/callisto/files/usr/keylayout/callisto_keypad0.kl:system/usr/keylayout/callisto_keypad0.kl \
	device/samsung/callisto/files/usr/keylayout/callisto_keypad0.kl:system/usr/keylayout/callisto_keypad3.kl \
	device/samsung/callisto/files/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/callisto/files/usr/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl \
	device/samsung/callisto/files/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/samsung/callisto/files/usr/keychars/callisto_keypad3.kcm.bin:system/usr/keychars/callisto_keypad0.kcm.bin \
	device/samsung/callisto/files/usr/keychars/callisto_keypad3.kcm.bin:system/usr/keychars/callisto_keypad3.kcm.bin \
	device/samsung/callisto/files/usr/keychars/sec_keypad.kcm.bin:system/usr/keychars/sec_keypad.kcm.bin \
	device/samsung/callisto/files/usr/keychars/callisto_keypad3.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	device/samsung/callisto/files/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin

# Board-specific
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/bin/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/callisto/files/etc/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/callisto/files/etc/init.d/02callisto:system/etc/init.d/02callisto \
    device/samsung/callisto/files/etc/init.d/05mountsd:system/etc/init.d/05mountsd

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/callisto/files/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/callisto/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/callisto/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# SD Card
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/etc/vold.fstab:system/etc/vold.fstab

# Media configuration xml file
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/etc/media_profiles.xml:/system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/callisto/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt


# Enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libargs=-d/dev/smd0 \
    rild.libpath=/system/lib/libsec-ril.so \
    ro.telephony.ril_class=samsung \
    ro.telephony.sends_barcount=1


# Networking properties
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=60

# Compcache properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=18
    
    ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/callisto/Kernel/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/samsung/callisto/callisto-vendor.mk)

$(call inherit-product, build/target/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# LDPI assets
PRODUCT_LOCALES += ldpi mdpi

PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-WILLING

PRODUCT_NAME := full_callisto
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := callisto
PRODUCT_MODEL := GT-I5510
PRODUCT_MANUFACTURER := samsung
