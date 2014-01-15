//
//  ZHTimeViewController.h
//  iLife
//
//  Created by i-Bejoy on 14-1-6.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ZHTimeViewController : NSViewController

@property (weak) IBOutlet NSTextField *timeTextField;
@property (weak) IBOutlet NSTextField *tipTextField;



- (IBAction)startTimer:(id)sender;
@end
