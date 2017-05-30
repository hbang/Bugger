TARGET = iphone:latest:10.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Bugger BuggerClient

Bugger_FILES = SpringBoard.x HBBGActivatorListener.x
Bugger_LIBRARIES = activator
Bugger_CFLAGS = -fobjc-arc

BuggerClient_FILES = Client.x HBBGDebuggerController.x
BuggerClient_FRAMEWORKS = UIKit
BuggerClient_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/Activator/Listeners/ws.hbang.bugger$(ECHO_END)
	$(ECHO_NOTHING)cp Info.plist $(THEOS_STAGING_DIR)/Library/Activator/Listeners/ws.hbang.bugger$(ECHO_END)
