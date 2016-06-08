ifeq ($(strip $(USE_DEVICE_SPECIFIC_CAMERA)),true)

MM_V4L2_DRIVER_LIST += msm8960
MM_V4L2_DRIVER_LIST += msm8974
MM_V4L2_DRIVER_LIST += msm8226
MM_V4L2_DRIVER_LIST += msm8610

ifeq ($(call is-board-platform-in-list,$(MM_V4L2_DRIVER_LIST)),true)
  ifneq ($(USE_CAMERA_STUB),true)
      include $(call all-subdir-makefiles)
    endif
endif

endif
