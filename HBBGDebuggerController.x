#import "HBBGDebuggerController.h"

@interface UIDebuggingInformationOverlay : UIWindow // (?)

+ (instancetype)overlay;

+ (void)prepareDebuggingOverlay;

- (void)toggleVisibility;

@end

@implementation HBBGDebuggerController

+ (void)toggle {
	[%c(UIDebuggingInformationOverlay) prepareDebuggingOverlay];
	[[%c(UIDebuggingInformationOverlay) overlay] toggleVisibility];
}

@end
