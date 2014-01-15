//
//  ZHAppDelegate.m
//  iLife
//
//  Created by i-Bejoy on 14-1-6.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHAppDelegate.h"
#import "ZHViewController.h"



@interface  ZHAppDelegate()
@property (nonatomic,strong) IBOutlet ZHViewController *masterViewController;
@end


@implementation ZHAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    // 1. Create the master View Controller
    self.masterViewController = [[ZHViewController alloc] initWithNibName:@"ZHViewController" bundle:nil];
    
    // 2. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
    
}

@end
