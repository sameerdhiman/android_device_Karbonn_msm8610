#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += device/Karbonn/msm8610/overlay

$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/Karbonn/msm8610/msm8610-vendor.mk)

#ANT stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

# Audio
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default \
    libbt-hci \
    libbt-utils \
    sdptool

# Display
PRODUCT_PACKAGES += \
    libqservice \
    libvirtual

# Keymaster (Keystore)
PRODUCT_PACKAGES += \
    keystore.msm8610 \
    keymaster_test

# PPPOE
PRODUCT_PACKAGES += \
    pppoe

# Power
PRODUCT_PACKAGES += \
    power.msm8610

# Wifi
PRODUCT_PACKAGES += \
    wcnss_service

# WPA Supplicant
PRODUCT_PACKAGES += \
    wpa_supplicant \
    libwpa_client

# Audio configuration files
PRODUCT_COPY_FILES += \
    device/Karbonn/msm8610/audio_conf/audio_policy.conf:system/etc/audio_policy.conf \
    device/Karbonn/msm8610/audio_conf/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/Karbonn/msm8610/audio_conf/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/Karbonn/msm8610/audio_conf/audio_platform_info.xml:system/etc/audio_platform_info.xml

# Media Profile and Codec configuration files
PRODUCT_COPY_FILES += \
    device/Karbonn/msm8610/media/media_profiles_8610.xml:system/etc/media_profiles.xml \
    device/Karbonn/msm8610/media/media_codecs_8610.xml:system/etc/media_codecs.xml

# WiFi configuration file
PRODUCT_COPY_FILES += \
    device/Karbonn/msm8610/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/Karbonn/msm8610/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/Karbonn/msm8610/prebuilt/sensors.msm8610.so:system/lib/hw/sensors.msm8610.so

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Keylayout
PRODUCT_PACKAGES += \
    gpio-keys \
    atmel_mxt_ts \
    synaptics_rmi4_i2c \
    ft5x06_ts

# fstab
PRODUCT_PACKAGES += \
    fstab.qcom

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#spec service
PRODUCT_PACKAGES += \
    init.qti.carrier.rc \
    adb_keys

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml

PRODUCT_COPY_FILES += \
    device/Karbonn/msm8610/whitelist_appops.xml:system/etc/whitelist_appops.xml

#Set default profile to FUT
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.logkit.ctrlcode=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# ADDITIONAL_BUILD_PROPERTIES += \
    ro.com.android.mobiledata=true \
    ro.com.android.dataroaming=true \
    ro.com.android.dateformat=DD/MM/YYYY \
    ro.carrier=unknown \
    ro.freecomm.TIME_12_24=12 \
    ro.freecomm.date=true \
    persist.sys.logkit.ctrlcode=1 \
    persist.sys.language=EN \
    persist.sys.country=US \
    persist.sys.timezone=Asia/Calcutta \
    persist.copy.finished=1 \
    persist.sys.dalvik.vm.lib=libdvm.so \
    net.bt.name=Android \
    dalvik.vm.stack-trace-file=/data/anr/traces.txt \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x5 \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.services.location \
    ro.gps.agps_provider=1 \
    persist.radio.calls.on.ims=true \
    persist.radio.jbims=1 \
    persist.radio.csvt.enabled=true \
    persist.radio.VT_ENABLE=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.radio.custom_ecc=1 \
    persist.radio.rat_on=combine \
    persist.radio.mt_sms_ack=20 \
    persist.env.c.phone.matchnum=10 \
    persist.radio.restore_mode_pref=1

PRODUCT_BOOT_JARS += qcmediaplayer:qcom.fmradio:vcard

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_LOCALES += th_TH vi_VN tl_PH hi_IN ar_EG ru_RU tr_TR pt_BR bn_IN mr_IN ta_IN te_IN zh_HK in_ID
PRODUCT_NAME := msm8610
PRODUCT_DEVICE := msm8610
PRODUCT_BRAND := Karbonn
PRODUCT_MODEL := Titanium S1 Plus
PRODUCT_MANUFACTURER := Karbonn

# Set CM Extra Version Information
TARGET_UNOFFICIAL_BUILD_ID := SDhi-C230WJA
CM_BUILD := Beta
