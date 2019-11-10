INSTALL_TARGET_PROCESSES = SpringBoard

export ARCHS = arm64 arm64e
export TARGET = iphone:clang:12.2:12.2
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LightKeys

after-install::
	install.exec "killall -9 SpringBoard"

LightKeys_FILES = Tweak.x
LightKeys_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
