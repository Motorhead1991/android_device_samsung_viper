# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/full_viper.mk)

PRODUCT_RELEASE_NAME := viper

# Setup device configuration
PRODUCT_NAME := cm_viper
PRODUCT_DEVICE := viper
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := SCH-I110

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=samsung/SCH-I110/SCH-I110:4.0.4/ICS/IMM76L:user/release-keys PRIVATE_BUILD_DESC="SCH-I110-user 4.0.4 ICS IMM76L release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += USER=android-build
PRODUCT_BUILD_PROP_OVERRIDES += KBUILD_BUILD_USER=android-build
PRODUCT_BUILD_PROP_OVERRIDES += KBUILD_BUILD_HOST=buildbot
