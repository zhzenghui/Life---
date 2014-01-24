//
//  ZHAppDelegate.h
//  iLife
//
//  Created by i-Bejoy on 14-1-6.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class HTTPServer;
@interface ZHAppDelegate : NSObject <NSApplicationDelegate>
{
    HTTPServer* httpServer;

}
@property (assign) IBOutlet NSWindow *window;

@end
