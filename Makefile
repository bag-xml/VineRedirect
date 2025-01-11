TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VineRedirect

VineRedirect_FILES = Tweak.x
VineRedirect_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += VinePref
include $(THEOS_MAKE_PATH)/aggregate.mk
