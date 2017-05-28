#
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from Exynos7580-common
include device/samsung/exynos7580-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := a3xelte,a3xeltexx

DEVICE_PATH := device/samsung/a3xeltexx

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Audio
#TARGET_AUDIOHAL_VARIANT := samsung

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Hardware
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw

# Init
TARGET_INIT_VENDOR_LIB := libinit_sec
TARGET_UNIFIED_DEVICE := true

# Kernel
TARGET_KERNEL_CONFIG := lineageos_a3xelte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a3xelte
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64


# Extracted with libbootimg
#BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt $(DEVICE_PATH)/dt.img --board SRPOJ08A000KU
#TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos

# Partitions
#BOARD_HAS_NO_MISC_PARTITION := false
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE :=0x002000000            # 33554432=32MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x002600000       # 39845888=38MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x00C800000          # 209715200=200MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0BB800000         # 3145728000=3GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x2CF3FB000       # 0x2CF400000(12067012608) - 0x000004000(footer=16384)=11.2GB
BOARD_FLASH_BLOCK_SIZE := 131072


# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.samsungexynos7580

# Radio
BOARD_RIL_CLASS := ../../../$(DEVICE_PATH)/ril
BOARD_MODEM_TYPE := tss310

# inherit from the proprietary version
-include vendor/samsung/a3xeltexx/BoardConfigVendor.mk
