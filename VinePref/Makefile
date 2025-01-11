TARGET := iphone:clang:latest:7.0
export TARGET=iphone:clang:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = VinePref

VinePref_FILES = XMLRootListController.m
VinePref_FRAMEWORKS = UIKit
VinePref_PRIVATE_FRAMEWORKS = Preferences
VinePref_INSTALL_PATH = /Library/PreferenceBundles
VinePref_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
