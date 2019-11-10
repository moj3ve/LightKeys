INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LightKeys

LightKeys_FILES = Tweak.x
LightKeys_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
