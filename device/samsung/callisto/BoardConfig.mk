USE_CAMERA_STUB := true


# inherit from the proprietary version
-include vendor/samsung/callisto/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_CPU_ABI := armeabi
TARGET_BOOTLOADER_BOARD_NAME := callisto

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x13600000
BOARD_PAGE_SIZE := 0x00000800


#Audio 

HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true

#Bluetooth

BOARD_HAVE_BLUETOOTH := true
BT_ALT_STACK := true
BRCM_BT_USE_BTL_IF := true
BRCM_BTL_INCLUDE_A2DP := true
BRCM_BTL_INCLUDE_OBEX := true
BRCM_BTL_OBEX_USE_DBUS := true

#GPU
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200


# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08c60000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/samsung/callisto/kernel

#BOARD_HAS_NO_SELECT_BUTTON := true

