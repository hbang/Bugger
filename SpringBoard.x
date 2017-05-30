#import "HBBGActivatorListener.h"

%ctor {
	// if activator has never seen us before, assign ourself with the default event
	if (![[LAActivator sharedInstance] hasSeenListenerWithName:@"ws.hbang.bugger"]) {
		[[LAActivator sharedInstance] assignEvent:[LAEvent eventWithName:@"libactivator.statusbar.tap.double.left"] toListenerWithName:@"ws.hbang.bugger"];
	}

	// register the listener with activator
	[[LAActivator sharedInstance] registerListener:[[HBBGActivatorListener alloc] init] forName:@"ws.hbang.bugger"];
}
