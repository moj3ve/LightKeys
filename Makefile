
export ARCHS = arm64 arm64e
export TARGET = iphone:clang:12.2:12.2
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LightKeys
LightKeys_FILES = Tweak.x


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/aggregate.mk
