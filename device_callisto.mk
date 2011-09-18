ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/callisto/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    brcm_patchram_plus \
    abtfilt \
    gps.callisto \
    gralloc.callisto \
    copybit.callisto \
    lights.msm7k \
    screencap

# Recovery tools
PRODUCT_PACKAGES += \
    flash_image \
    dump_image \
    erase_image \
    make_ext4fs \
    e2fsck

# Boot screen
#PRODUCT_COPY_FILES += \
#    device/samsung/callisto/files/root/EUROPA.rle:root/EUROPA.rle \
#    device/samsung/callisto/files/root/EUROPA.rle:recovery/root/EUROPA.rle

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
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Kernel modules - normal
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/root/lib/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/callisto/files/root/lib/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/callisto/files/root/lib/modules/acc_cal_param.ko:system/lib/modules/acc_cal_param.ko \
    device/samsung/callisto/files/root/lib/modules/sec_param.ko:system/lib/modules/sec_param.ko \
   # device/samsung/callisto/files/root/lib/modules/zram.ko:system/lib/modules/zram.ko

# Kernel modules - recovery
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/root/lib/modules/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    device/samsung/callisto/files/root/lib/modules/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    device/samsung/callisto/recovery.fstab_full:recovery/root/etc/recovery.fstab \
    device/samsung/callisto/files/bin/fat.format:recovery/root/sbin/fat.format

# Device-specific keymaps
PRODUCT_COPY_FILES += \
	device/samsung/callisto/input/Keymaps/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/callisto/input/Keymaps/callisto_headset.kl:system/usr/keylayout/callisto_headset.kl \
	device/samsung/callisto/input/Keymaps/callisto_keypad3.kl:system/usr/keylayout/callisto_keypad3.kl \
	device/samsung/callisto/input/Keymaps/qwerty.kl:system/usr/keylayout/qwerty.kl

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/ueventd.gt-i5510.rc:root/ueventd.gt-i5510.rc \
    device/samsung/callisto/files/init.gt-i5510.rc:root/init.gt-i5510.rc \
    device/samsung/callisto/files/bin/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/callisto/files/bin/mad2sd:root/sbin/mad2sd \
    device/samsung/callisto/files/etc/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/callisto/files/etc/init.d/02callisto:system/etc/init.d/02callisto \
    device/samsung/callisto/files/etc/init.d/05mountsd:system/etc/init.d/05mountsd

# Sensors
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    vendor/samsung/callisto/proprietary/bin/memsicd:system/bin/memsicd

# 3D
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/callisto/files/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/callisto/files/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/callisto/files/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/callisto/files/lib/libgsl.so:system/lib/libgsl.so \
    vendor/samsung/callisto/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/samsung/callisto/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# Camera
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/samsung/callisto/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/samsung/callisto/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so

# Wifi
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/callisto/files/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/callisto/files/bin/dhcpcd:system/bin/dhcpcd \
    vendor/samsung/callisto/proprietary/bin/wlan_tool:system/bin/wlan_tool \
    vendor/samsung/callisto/proprietary/bin/wmiconfig:system/bin/wmiconfig \
    vendor/samsung/callisto/proprietary/bin/hostapd:system/bin/hostapd \
    vendor/samsung/callisto/proprietary/bin/hostapd_cli:system/bin/hostapd_cli \
    vendor/samsung/callisto/proprietary/bin/hostapd_wps:system/bin/hostapd_wps \
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
    vendor/samsung/callisto/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/samsung/callisto/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/samsung/callisto/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# Samsung RIL
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/bin/rild:system/bin/rild \
    vendor/samsung/callisto/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/samsung/callisto/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/samsung/callisto/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \
    vendor/samsung/callisto/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \
    vendor/samsung/callisto/proprietary/lib/libdiag.so:system/lib/libdiag.so

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/bin/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd:system/bin/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd

# OMX libraries
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/samsung/callisto/files/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
    device/samsung/callisto/files/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/samsung/callisto/files/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/samsung/callisto/files/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/samsung/callisto/files/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
    device/samsung/callisto/files/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/samsung/callisto/files/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/samsung/callisto/files/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/samsung/callisto/files/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/samsung/callisto/files/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    device/samsung/callisto/files/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    device/samsung/callisto/files/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
    device/samsung/callisto/files/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    device/samsung/callisto/files/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/samsung/callisto/files/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/samsung/callisto/files/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/samsung/callisto/files/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/samsung/callisto/files/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    device/samsung/callisto/files/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/samsung/callisto/files/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/samsung/callisto/files/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/samsung/callisto/files/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    device/samsung/callisto/files/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, build/target/product/full_base.mk)


# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

$(call inherit-product-if-exists, vendor/samsung/callisto/callisto-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/callisto/overlay

# LDPI assets
PRODUCT_LOCALES += ldpi mdpi
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/ldpi/media/bootanimation.zip:system/media/bootanimation.zip

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-WILLING

PRODUCT_NAME := full_callisto
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := callisto
PRODUCT_MODEL := GT-I5510
PRODUCT_MANUFACTURER := samsung
