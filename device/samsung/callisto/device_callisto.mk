$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/callisto/callisto-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/callisto/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/callisto/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/samsung/callisto/configs/egl.cfg:system/lib/egl/egl.cfg

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/ldpi/media/bootanimation.zip:system/media/bootanimation.zip


PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    gralloc.callisto \
    copybit.calisto \
    gps.callisto \
    libOmxCore \
    libOmxVidEnc \
    libmm-omxcore \
    lights.msm7k \
    dexpreopt \
    screencap

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# 3D
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/samsung/callisto/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/samsung/callisto/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/samsung/callisto/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/samsung/callisto/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/samsung/callisto/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/samsung/callisto/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw


# Audio
PRODUCT_COPY_FILES += \
    device/samsung/callisto/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/callisto/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    vendor/samsung/callisto/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/samsung/callisto/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so 

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/bin/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd:system/bin/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd

# Camera
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/samsung/callisto/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/samsung/callisto/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so

# Gralloc Fix screen issue
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so

# Keymaps
PRODUCT_COPY_FILES += \
	device/samsung/callisto/input/Keymaps/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/callisto/input/Keymaps/callisto_headset.kl:system/usr/keylayout/callisto_headset.kl \
	device/samsung/callisto/input/Keymaps/callisto_keypad3.kl:system/usr/keylayout/callisto_keypad3.kl \
	device/samsung/callisto/input/Keymaps/qwerty.kl:system/usr/keylayout/qwerty.kl

# Media configuration xml file
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/etc/media_profiles.xml:/system/etc/media_profiles.xml

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# OMX libraries
PRODUCT_COPY_FILES += \
    device/samsung/callisto/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/samsung/callisto/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/samsung/callisto/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/samsung/callisto/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/samsung/callisto/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/samsung/callisto/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/samsung/callisto/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/samsung/callisto/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/samsung/callisto/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/samsung/callisto/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/samsung/callisto/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/samsung/callisto/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/samsung/callisto/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/samsung/callisto/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/samsung/callisto/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/samsung/callisto/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/samsung/callisto/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Samsung RIL
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \
    vendor/samsung/callisto/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \
    vendor/samsung/callisto/proprietary/lib/libseccamera.so:system/lib/libseccamera.so \
    vendor/samsung/callisto/proprietary/lib/libsecgps.so:system/lib/libsecgps.so

# Sensors
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    vendor/samsung/callisto/proprietary/bin/memsicd:system/bin/memsicd

# SD Card
PRODUCT_COPY_FILES += \
    device/samsung/callisto/files/etc/vold.fstab:system/etc/vold.fstab

# Wifi
PRODUCT_COPY_FILES += \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    vendor/samsung/callisto/proprietary/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    vendor/samsung/callisto/proprietary/bin/wlan_tool:system/bin/wlan_tool \
    vendor/samsung/callisto/proprietary/bin/wmiconfig:system/bin/wmiconfig \
    vendor/samsung/callisto/proprietary/bin/hostapd:system/bin/hostapd \
    vendor/samsung/callisto/proprietary/bin/hostapd_cli:system/bin/hostapd_cli \
    vendor/samsung/callisto/proprietary/bin/hostapd_wps:system/bin/hostapd_wps \
    device/samsung/callisto/files/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/callisto/files/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/callisto/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/callisto/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf



$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_callisto
PRODUCT_DEVICE := callisto
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung