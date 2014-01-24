//
//  ZHAppDelegate.m
//  iLife
//
//  Created by i-Bejoy on 14-1-6.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHAppDelegate.h"
#import "ZHViewController.h"

#import "HTTPServer.h"
#import "DDTTYLogger.h"

@interface  ZHAppDelegate()
@property (nonatomic,strong) IBOutlet ZHViewController *masterViewController;
@end


@implementation ZHAppDelegate

#define KCachesDocumentDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define KCachesDocumentDirectoryFiles [KCachesDocumentDirectory stringByAppendingPathComponent:@"/files"]
#define KCachesDocumentName(fileName) [NSString stringWithFormat:@"%@/%@",  KDocumentDirectoryFiles ,fileName]



- (void)loadServer {
    
    // 启动一个轻量级的httpsverver
    // Configure our logging framework.
	// To keep things simple and fast, we're just going to log to the Xcode console.
	[DDLog addLogger:[DDTTYLogger sharedInstance]];
	
	// Create server using our custom MyHTTPServer class
	httpServer = [[HTTPServer alloc] init];
	
	// Tell the server to broadcast its presence via Bonjour.
	// This allows browsers such as Safari to automatically discover our service.
	[httpServer setType:@"_http._tcp."];
	
	// Normally there's no need to run our server on any specific port.
	// Technologies like Bonjour allow clients to dynamically discover the server's port at runtime.
	// However, for easy testing you may want force a certain port so you can just hit the refresh button.
	[httpServer setPort:12345];
	
	// Serve files from our embedded Web folder
    [httpServer setDocumentRoot:KCachesDocumentDirectoryFiles];
	// Start the server (and check for problems)
	
	NSError *error;
	if(![httpServer start:&error])
	{
//		DLog(@"Error starting HTTP Server: %@", error);
	}
    
    
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self loadServer];

    
    
    
    // 1. Create the master View Controller
    self.masterViewController = [[ZHViewController alloc] initWithNibName:@"ZHViewController" bundle:nil];
    
    // 2. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
    
}

@end
