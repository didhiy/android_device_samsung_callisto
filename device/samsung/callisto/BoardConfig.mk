USE_CAMERA_STUB := false

# Fake building with froyo cam, as old libcam is not here yet
BOARD_USE_FROYO_LIBCAMERA := true

# inherit from the proprietary version
-include vendor/samsung/callisto/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := callisto

#BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x14600000
#BOARD_KERNEL_PAGESIZE := 4096
BOARD_PAGE_SIZE := 0x00001000

TARGET_OTA_ASSERT_DEVICE := callisto
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_LDPI_RECOVERY := true
#BOARD_HAS_JANKY_BACKBUFFER := true
#BOARD_USE_GR_FLIP_32 := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
#GRALLOC_MODULE_PERFORM_DECIDE_PUSH_BUFFER_HANDLING := true
BOARD_NO_RGBX_8888 := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
BOARD_EGL_CFG := device/samsung/callisto/files/lib/egl/egl.cfg

#cat /proc/LinuStoreIII/bmlinfo 
#FSR VERSION: FSR_1.2.1p1_b139_RTM
#minor       position           size     units       id
#   1: 0x00000000-0x00180000 0x00180000      6        1
#   2: 0x00180000-0x00200000 0x00080000      2        2
#   3: 0x00200000-0x002c0000 0x000c0000      3        3
#   4: 0x002c0000-0x01bc0000 0x01900000    100        4
#   5: 0x01bc0000-0x03400000 0x01840000     97       23
#   6: 0x03400000-0x03900000 0x00500000     20       25
#   7: 0x03900000-0x05200000 0x01900000    100        5
#   8: 0x05200000-0x05400000 0x00200000      8        6
#   9: 0x05400000-0x05e00000 0x00a00000     40        7
#  10: 0x05e00000-0x06800000 0x00a00000     40        8
#  11: 0x06800000-0x068c0000 0x000c0000      3        9
#  12: 0x068c0000-0x12800000 0x0bf40000    765       21
#  13: 0x12800000-0x1dc00000 0x0b400000    720       22
#  14: 0x1dc00000-0x1f500000 0x01900000    100       24

BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 200 540 160
BOARD_USERDATAIMAGE_PARTITION_SIZE := 188743680
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/callisto/recovery_kernel
TARGET_PREBUILT_KERNEL := device/samsung/callisto/kernel

BOARD_BML_BOOT := /dev/block/bml9
BOARD_BML_RECOVERY := /dev/block/bml10

#TARGET_USERIMAGES_USE_EXT4 := true
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_RECOVERY_INITRC := device/samsung/callisto/recovery.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/samsung/callisto/recovery/recovery_ui.c

# Use screencap to capture frame buffer for ddms
BOARD_USE_SCREENCAP := true

TARGET_PROVIDES_LIBAUDIO := true 

# Enabled For HW Video Decoding
#TARGET_DONT_SET_AUDIO_AAC_FORMAT := true
#TARGET_OVERLAY_ALWAYS_DETERMINES_FORMAT := true
#TARGET_USE_SOFTWARE_AUDIO_AAC := true

# Sensors
TARGET_USES_OLD_LIBSENSORS_HAL:=true

BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := callisto
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# USB
BOARD_CUSTOM_USB_CONTROLLER := ../../device/samsung/callisto/UsbController.cpp
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun"
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# WiFi
PRODUCT_WIRELESS_TOOLS      := true
WPA_SUPPLICANT_VERSION      := VER_0_5_X
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
BOARD_WLAN_DEVICE           := ar6000
WIFI_DRIVER_MODULE_PATH     := "/system/wifi/ar6000.ko"
#WIFI_DRIVER_MODULE_PATH     := rfkill
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := ar6000

# 3G
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"

# JIT / Optimizations
WITH_DEXPREOPT := true
JS_ENGINE := v8

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
# Should be bcm2049 but hardware is not yet supported
BOARD_FM_DEVICE := bcm4325
#BOARD_USE_BROADCOM_FM_VOLUME_HACK := true


