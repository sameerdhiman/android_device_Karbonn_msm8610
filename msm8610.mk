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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product-if-exists, vendor/Karbonn/msm8610/msm8610-vendor.mk)

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio_policy.msm8610 \
    audio.primary.msm8610 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Tiny ALSA
PRODUCT_PACKAGES += \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default \
    audio.a2dp.default \
    libbt-hci \
    libbt-utils \
    sdptool

# Camera
PRODUCT_PACKAGES += \
    camera.msm8610 \
    mm-qcamera-app \
    libmmcamera_interface \
    libmmjpeg_interface \
    libqomx_core \

# Display
PRODUCT_PACKAGES += \
    copybit.msm8610 \
    gralloc.msm8610 \
    hwcomposer.msm8610 \
    lights.msm8610 \
    memtrack.msm8610 \
    libmemalloc \
    liboverlay \
    libqdutils \
    libqdMetaData \
    libqservice \
    libvirtual

# Keymaster (Keystore)
PRODUCT_PACKAGES += \
    keystore.msm8610 \
    keymaster_test

# Media OMX
PRODUCT_PACKAGES += \
    libdashplayer \
    libstagefrighthw \
    libOmxCore \
    libOmxVenc \
    libc2dcolorconvert \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVdecHevc \
    qcmediaplayer

PRODUCT_BOOT_JARS += qcmediaplayer

# Misc
PRODUCT_PACKAGES += \
    mmi \
    mksh \
    flatland \
    curl \
    cplay \
    am \
    libbson \
    libcurl

#    libnetcmdiface

# MobiCore
PRODUCT_PACKAGES += \
    libMcClient \
    mcDriverDaemon

# Power
PRODUCT_PACKAGES += \
    power.msm8610

# GPS
# PRODUCT_PACKAGES += \
#    gps.default

# Sensors
# PRODUCT_PACKAGES += \
#    sensors.msm8610

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Crda
PRODUCT_PACKAGES += \
    crda \
    linville.key.pub.pem \
    regdbdump \
    regulatory.bin

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Filesystem tools
PRODUCT_PACKAGES += \
    setup_fs

# FM radio
PRODUCT_PACKAGES += \
    FM2 \
    FMRecord \
    libqcomfm_jni \
    qcom.fmradio \
    qcom.fmradio.xml

# Misc
PRODUCT_PACKAGES += \
    libxml2

# Random
PRODUCT_PACKAGES += \
    qrngd \
    qrngp

# Wifi
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    wcnss_service

# WPA Supplicant
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wpa_supplicant \
    libwpa_client

PRODUCT_COPY_FILES += \
    external/wpa_supplicant_8/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    external/wpa_supplicant_8/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    external/wpa_supplicant_8/hostapd/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/Karbonn/msm8610/prebuilt/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/Karbonn/msm8610/prebuilt/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    device/Karbonn/msm8610/prebuilt/gps.default.so:system/lib/hw/gps.default.so \
    device/Karbonn/msm8610/prebuilt/sensors.msm8610.so:system/lib/hw/sensors.msm8610.so

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Keylayout
PRODUCT_PACKAGES += \
    gpio-keys \
    atmel_mxt_ts \
    synaptics_rmi4_i2c \
    ft5x06_ts

# INIT and ETC Prebuilt
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.bt.sh \
    hsic.control.bt.sh \
    init.ath3k.bt.sh \
    init.qcom.efs.sync.sh \
    init.qcom.coex.sh \
    init.qcom.fm.sh \
    init.qcom.sdio.sh \
    init.qcom.wifi.sh \
    init.crda.sh \
    init.qcom.rc \
    init.qcom.factory.sh \
    init.qcom.sh \
    init.qcom.class_core.sh \
    init.class_main.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    ueventd.qcom.rc \
    init.qcom.syspart_fixup.sh \
    init.qcom.audio.sh \
    qca6234-service.sh \
    hcidump.sh \
    init.qcom.ssr.sh\
    init.mdm.sh \
    init.qcom.uicc.sh \
    init.qcom.modem_links.sh \
    enable_swap.sh \
    init.qti.carrier.rc \
    init.target.rc

# Copy fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:root/fstab.qcom

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

ADDITIONAL_BUILD_PROPERTIES += \
    ro.com.android.dataroaming=true \
    ro.com.android.dateformat=DD/MM/YYYY \
    ro.carrier=unknown \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so \
    persist.radio.apm_sim_not_pwdn=1 \
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
    persist.radio.mt_sms_ack=20

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_LOCALES := en_US
PRODUCT_NAME := msm8610
PRODUCT_DEVICE := msm8610
PRODUCT_BRAND := Karbonn
PRODUCT_MODEL := Titanium S1 Plus
PRODUCT_MANUFACTURER := Karbonn
