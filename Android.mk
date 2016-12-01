#
# Copyright (C) 2016 Sameer Dhiman
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

ifneq ($(filter msm8610, $(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

QCRIL_DB_LINK := \
    qcril.db.link

QCRIL_DB_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/Default/data/misc/radio/,$(notdir $(QCRIL_DB_LINK)))
$(QCRIL_DB_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "QCRIL Database link: $@"
	@mkdir -p $(dir $@)
	# @rm -rf $@
	$(hide) ln -sf /data/misc/radio/qcril.db $@

ALL_DEFAULT_INSTALLED_MODULES += $(QCRIL_DB_SYMLINKS)

include $(CLEAR_VARS)

VENDOR_PROP_LINK := \
    vendor.prop

VENDOR_PROP_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/Default/system/vendor/speccfg/,$(notdir $(VENDOR_PROP_LINK)))
$(VENDOR_PROP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Vendor Prop link: $@"
	@mkdir -p $(dir $@)
	# @rm -rf $@
	$(hide) ln -sf /system/vendor/speccfg/$(notdir $@) $@.link

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_PROP_SYMLINKS)

include $(CLEAR_VARS)

BUILD_PROP_LINK := \
    build.prop

BUILD_PROP_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/Default/system/,$(notdir $(BUILD_PROP_LINK)))
$(BUILD_PROP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Build Prop link: $@"
	@mkdir -p $(dir $@)
	# @rm -rf $@
	$(hide) ln -sf /system/$(notdir $@) $@.link

ALL_DEFAULT_INSTALLED_MODULES += $(BUILD_PROP_SYMLINKS)

include $(CLEAR_VARS)

APNS_CONF_LINK := \
    apns-conf.xml

APNS_CONF_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/Default/system/etc/,$(notdir $(APNS_CONF_LINK)))
$(APNS_CONF_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "APNS Config link: $@"
	@mkdir -p $(dir $@)
	# @rm -rf $@
	$(hide) ln -sf /system/etc/$(notdir $@) $@.link

ALL_DEFAULT_INSTALLED_MODULES += $(APNS_CONF_SYMLINKS)

include $(CLEAR_VARS)

CDMA_CALL_CONF_LINK := \
    cdma_call_conf.xml

CDMA_CALL_CONF_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/Default/system/etc/,$(notdir $(CDMA_CALL_CONF_LINK)))
$(CDMA_CALL_CONF_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CDMA Call Config link: $@"
	@mkdir -p $(dir $@)
	# @rm -rf $@
	$(hide) ln -sf /system/etc/$(notdir $@) $@.link

ALL_DEFAULT_INSTALLED_MODULES += $(CDMA_CALL_CONF_SYMLINKS)

include $(CLEAR_VARS)

SPN_CONF_LINK := \
    spn-conf.xml

SPN_CONF_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/Default/system/etc/,$(notdir $(SPN_CONF_LINK)))
$(SPN_CONF_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "SPN Call Config link: $@"
	@mkdir -p $(dir $@)
	# @rm -rf $@
	$(hide) ln -sf /system/etc/$(notdir $@) $@.link

ALL_DEFAULT_INSTALLED_MODULES += $(SPN_CONF_SYMLINKS)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif