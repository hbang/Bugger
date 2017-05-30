#import "HBBGActivatorListener.h"
#import "HBBGDebuggerController.h"
#import <Foundation/NSDistributedNotificationCenter.h>
#import <SpringBoard/SpringBoard.h>
#import <SpringBoard/SBApplication.h>

@implementation HBBGActivatorListener

- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	event.handled = YES;

	SBApplication *app = ((SpringBoard *)[UIApplication sharedApplication])._accessibilityFrontMostApplication;

	if (app && app.bundleIdentifier) {
		[[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"HBBGToggleDebuggerNotification" object:nil userInfo:@{
			@"bundleIdentifier": app.bundleIdentifier
		}];
	} else {
		[%c(HBBGDebuggerController) toggle];
	}
}

@end
