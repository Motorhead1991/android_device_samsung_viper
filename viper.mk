# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

#$(call inherit-product, device/common/gps/gps_eu_supl.mk)

#DEVICE_PACKAGE_OVERLAYS := device/samsung/viper/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := viper
PRODUCT_DEVICE := viper
PRODUCT_MODEL := SCH-I110

PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    FM \
    Torch \
    make_ext4fs \
    FM \
    rzscontrol \
    SamsungServiceMode \
    bdaddr_read \
    toggleshutter \
    dexpreopt \
    e2fsck \
    brcm_patchram_plus \
    copybit.viper \
    lights.viper \
    gralloc.viper \
    setup_fs \
    screencap

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := /samsung/viper/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
       sec_touchscreen.kcm \
       sec_jack.kcm \
       sec_key.kcm

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

# proprietary side of the device
#$(call inherit-product-if-exists, vendor/samsung/viper/viper-vendor.mk)

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/viper/prebuilt/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/viper/config/init.smdkc110.rc:root/init.smdkc110.rc \
    #device/samsung/viper/config/ueventd.rc:root/ueventd.rc \
    device/samsung/viper/config/ueventd.smdkc110.rc:root/ueventd.smdkc110.rc \
    device/samsung/viper/config/lpm.rc:root/lpm.rc \
    device/samsung/viper/config/fota.rc:root/fota.rc \
    device/samsung/viper/config/init.rc:root/init.rc

# 3d
PRODUCT_COPY_FILES += \
    device/samsung/viper/egl.cfg:system/lib/egl/egl.cfg 

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/viper/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/samsung/viper/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/viper/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/viper/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/viper/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf
    
# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Kernel binaries for recovery
PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/prebuilt/busybox:root/sbin/busybox \
#	$(LOCAL_PATH)/prebuilt/e2fsck:root/sbin/e2fsck \
#	$(LOCAL_PATH)/prebuilt/fat.format:root/sbin/fat.format \
#	$(LOCAL_PATH)/prebuilt/fix_permissions:root/sbin/fix_permissions \
#	$(LOCAL_PATH)/prebuilt/mke2fs:root/sbin/mke2fs \
#	$(LOCAL_PATH)/prebuilt/parted:root/sbin/parted \
#	$(LOCAL_PATH)/prebuilt/sdparted:root/sbin/sdparted \
#	$(LOCAL_PATH)/prebuilt/tune2fs:root/sbin/tune2fs \
#	$(LOCAL_PATH)/scripts/busybox.sh:root/sbin/busybox.sh \
	

#Kernel Modules for Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/modules/ansi_cprng.ko:root/lib/modules/ansi_cprng.ko \
	$(LOCAL_PATH)/prebuilt/modules/bthid.ko:root/lib/modules/bthid.ko \
	$(LOCAL_PATH)/prebuilt/modules/dhd.ko:root/lib/modules/dhd.ko \
	$(LOCAL_PATH)/prebuilt/modules/dpram.ko:root/lib/modules/dpram.ko \
	$(LOCAL_PATH)/prebuilt/modules/j4fs.ko:root/lib/modules/j4fs.ko \
	$(LOCAL_PATH)/prebuilt/modules/param.ko:root/lib/modules/param.ko \
	$(LOCAL_PATH)/prebuilt/modules/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
	$(LOCAL_PATH)/prebuilt/modules/vibrator.ko:root/lib/modules/vibrator.ko \
	$(LOCAL_PATH)/prebuilt/modules/wtlfota_dpram.ko:root/lib/modules/wtlfota_dpram.ko \
	$(LOCAL_PATH)/prebuilt/modules/wtlfota_idpram.ko:root/lib/modules/wtlfota_idpram.ko

ifeq ($(SUB_MODEL),S720C)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/modules/modem_if.ko:root/lib/modules/modem_if.ko
endif

#recovery.fstab
PRODUCT_COPY_FILES += \
	device/samsung/viper/recovery.fstab:root/res/recovery.fstab \
	device/samsung/viper/recovery.fstab:root/etc/recovery.fstab \
	device/samsung/viper/recovery/recovery.rc:root/recovery.rc 

#Recovery images
PRODUCT_COPY_FILES += \
	bootable/recovery/res/images/icon_installing_overlay01.png:root/res/images/icon_installing_overlay01.png \
	bootable/recovery/res/images/icon_installing_overlay02.png:root/res/images/icon_installing_overlay02.png \
	bootable/recovery/res/images/icon_installing_overlay03.png:root/res/images/icon_installing_overlay03.png \
	bootable/recovery/res/images/icon_installing_overlay04.png:root/res/images/icon_installing_overlay04.png \
	bootable/recovery/res/images/icon_installing_overlay05.png:root/res/images/icon_installing_overlay05.png \
	bootable/recovery/res/images/icon_installing_overlay06.png:root/res/images/icon_installing_overlay06.png \
	bootable/recovery/res/images/icon_installing_overlay07.png:root/res/images/icon_installing_overlay07.png \
	bootable/recovery/res/images/icon_installing.png:root/res/images/icon_installing.png \
	bootable/recovery/res/images/indeterminate01.png:root/res/images/indeterminate01.png \
	bootable/recovery/res/images/indeterminate02.png:root/res/images/indeterminate02.png \
	bootable/recovery/res/images/indeterminate03.png:root/res/images/indeterminate03.png \
	bootable/recovery/res/images/indeterminate04.png:root/res/images/indeterminate04.png \
	bootable/recovery/res/images/indeterminate05.png:root/res/images/indeterminate05.png \
	bootable/recovery/res/images/indeterminate06.png:root/res/images/indeterminate06.png \
	bootable/recovery/res/images/progress_empty.png:root/res/images/progress_empty.png \
	bootable/recovery/res/images/progress_fill.png:root/res/images/progress_fill.png \
	bootable/recovery/res/images/stitch.png:root/res/images/stitch.png
	
#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/viper/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/viper/prebuilt/audio.conf:system/etc/bluetooth/audio.conf
## keymap
PRODUCT_COPY_FILES += \
    device/samsung/viper/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/samsung/viper/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/viper/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/viper/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/viper/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/viper/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    device/samsung/viper/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=samsung \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1
	persist.service.adb.enable=1


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=64m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

#move recovery binary in place
PRODUCT_COPY_FILES += \
#	out/target/product/viper/recovery/root/sbin/recovery:root/sbin/recovery
# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
#$(call inherit-product-if-exists, vendor/samsung/viper/viper-vendor-blobs.mk)
