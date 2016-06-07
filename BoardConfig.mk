USE_DEVICE_SPECIFIC_CAMERA := false
USE_CAMERA_STUB := false
BUILD_TINY_ANDROID := false

# inherit from the proprietary version
-include vendor/Karbonn/msm8610/BoardConfigVendor.mk

# +++++++++++++++++++
# Motherboard Section
# +++++++++++++++++++
TARGET_BOARD_PLATFORM := msm8610
TARGET_BOOTLOADER_BOARD_NAME := MSM8610
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno302
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

# +++++++++++++++++
# Processor Section
# +++++++++++++++++
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

#Dalvik
TARGET_ARCH_LOWMEM := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp

# ++++++++++++++
# Kernel Section
# ++++++++++++++
# Source
# ******
#TARGET_KERNEL_SOURCE := kernel/LNX.LA.3.5.1-09810-8x10.0
#TARGET_KERNEL_CONFIG := kts1p_a444_wlan_defconfig

# TARGET_KERNEL_SOURCE := kernel/OLD_AU_LINUX_ANDROID_LNX.LA.3.5.3_RB1.04.04.02.043.029
TARGET_KERNEL_SOURCE := kernel/AU_LINUX_ANDROID_LNX.LA.3.5.3_RB1.04.04.02.043.029
TARGET_KERNEL_CONFIG := kts1p_a444_wlan_defconfig

# TARGET_KERNEL_SOURCE := kernel/LA.BF.1.1.2.c1-00400-8x10.0
# TARGET_KERNEL_CONFIG := kts1p_a511_defconfig

# Kernel Image
# ************
BOARD_CUSTOM_BOOTIMG_MK := device/Karbonn/msm8610/mkbootimg.mk
BOARD_KERNEL_SEPARATED_DT := true
BOARD_DTBTOOL_ARGS += --force-v2
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom androidboot.selinux=disabled user_debug=31 msm_rtb.filter=0x37
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100

# ++++++++++++++++++++++++++++++++++++++
# Partition Sizes and Filesystem Section
# ++++++++++++++++++++++++++++++++++++++
# fix this up by examining /proc/mtd on a running device

# Partition Sizes
# ***************
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1224719872
BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072

# Partition Filesystem
# ********************
TARGET_SYSTEMIMAGE_USE_SQUISHER := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# ++++++++++++++++++++++++++++++++++
# Qualcomm Hardware Specific Section
# ++++++++++++++++++++++++++++++++++
# Bionic
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# FM radio
# BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# QCOM Hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# QCOM BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# ++++++++++++++++
# Graphics Section
# ++++++++++++++++
TARGET_QCOM_DISPLAY_VARIANT := caf-sdhi
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
BOARD_EGL_CFG := device/Karbonn/msm8610/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
COMMON_GLOBAL_CFLAGS += -DMDSS_TARGET

# ++++++++++++
# Misc Section
# ++++++++++++
# Liblight
TARGET_PROVIDES_LIBLIGHT := false

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm

# Power
TARGET_POWERHAL_VARIANT := qcom

# ++++++++++++++++++
# Multimedia Section
# ++++++++++++++++++
# Media
TARGET_QCOM_MEDIA_VARIANT := caf-sdhi
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_SSR := false
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
# AUDIO_FEATURE_DISABLED_SSR := true
# AUDIO_FEATURE_DISABLED_DS1_DOLBY_DAP := true

# WLAN
WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# BOARD_HAS_QCOM_WLAN_SDK := true
# TARGET_USES_WCNSS_CTRL := true
# TARGET_PROVIDES_WCNSS_QMI := true
# TARGET_USES_QCOM_WCNSS_QMI := true
# WIFI_DRIVER_FW_PATH_AP := "ap"
# WIFI_DRIVER_FW_PATH_STA := "sta"

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# ++++++++++++++++
# Recovery Section
# ++++++++++++++++
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Choose recovery variants from cwm, cm, philz and twrp. For cwm comment below line
RECOVERY_VARIANT := cm

# TARGET_RECOVERY_FSTAB := device/Karbonn/msm8610/twrp.fstab
# TARGET_RECOVERY_INITRC := device/Karbonn/msm8610/twrp-init.rc

# CM Recovery
# ***********
# TARGET_HAVE_OEMLOCK := false

# Philz Recovery
# **************
# RECOVERY_NAME := Philz for Karbonn S1 Plus
# BOARD_RECOVERY_SWIPE := true
# TARGET_COMMON_NAME := Titanium S1 Plus
# BOARD_USE_MTK_LAYOUT := false
## BOARD_MTK_BOOT_LABEL := "/bootimg"
# PHILZ_TOUCH_RECOVERY := true
# RECOVERY_TOUCH_DEBUG := false
# BOARD_USE_NTFS_3G := false
# BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

# TWRP Recovery
# *************
# TW_OEM_BUILD := false
# DEVICE_RESOLUTION := 480x800
# TW_TARGET_USES_QCOM_BSP := true
# BOARD_HAS_NO_REAL_SDCARD := true
# TARGET_RECOVERY_QCOM_RTC_FIX := true
# TW_NO_EXFAT := true
# TW_NO_EXFAT_FUSE := true
# TW_INCLUDE_NTFS_3G := false
# TW_DEFAULT_EXTERNAL_STORAGE := true
# TWHAVE_SELINUX := true

# TW_INTERNAL_STORAGE_PATH := "/sdcard0"
# TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard0"
# TW_EXTERNAL_STORAGE_PATH := "/sdcard1"
# TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"
# TW_INCLUDE_JB_CRYPTO := true
# TW_INCLUDE_FB2PNG := false
# TW_EXCLUDE_SUPERSU := true
# TW_EXCLUDE_MTP := true
# TW_NO_SCREEN_BLANK := true
# TW_NO_REBOOT_BOOTLOADER := true
# TW_NO_REBOOT_RECOVERY := true
