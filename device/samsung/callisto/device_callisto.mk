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
    dexpreopt

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/callisto/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/callisto/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

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


# Keymaps
PRODUCT_COPY_FILES += \
	device/samsung/callisto/input/Keymaps/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/callisto/input/Keymaps/callisto_headset.kl:system/usr/keylayout/callisto_headset.kl \
	device/samsung/callisto/input/Keymaps/callisto_keypad3.kl:system/usr/keylayout/callisto_keypad3.kl \
	device/samsung/callisto/input/Keymaps/qwerty.kl:system/usr/keylayout/qwerty.kl


$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_callisto
PRODUCT_DEVICE := callisto
