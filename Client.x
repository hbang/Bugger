#import "HBBGDebuggerController.h"
#import <Foundation/NSDistributedNotificationCenter.h>

%ctor {
	[[NSDistributedNotificationCenter defaultCenter] addObserverForName:@"HBBGToggleDebuggerNotification" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
		NSString *bundleIdentifier = notification.userInfo[@"bundleIdentifier"];

		if (bundleIdentifier && [[NSBundle mainBundle].bundleIdentifier isEqualToString:bundleIdentifier]) {
			[HBBGDebuggerController toggle];
		}
	}];
}
