## Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/Karbonn/msm8610/msm8610.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := msm8610
PRODUCT_NAME := msm8610
PRODUCT_BRAND := Karbonn
PRODUCT_MODEL := Titanium S1 Plus
PRODUCT_MANUFACTURER := Karbonn
PRODUCT_RELEASE_NAME := Titanium S1 Plus