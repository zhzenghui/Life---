//
//  ZHTimeViewController.m
//  iLife
//
//  Created by i-Bejoy on 14-1-6.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHTimeViewController.h"


@interface ZHTimeViewController ()
{
    NSTimer *currentTimer;
}
@end



@implementation ZHTimeViewController
static NSInteger t =1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}



- (void)sendNotificationsCenter
{
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    notification.title = @"定时器 Say hi";
    NSString *infoString = [NSString stringWithFormat:@"当前定时%@分钟,已经结束", [self.timeTextField stringValue]];

    
    notification.informativeText = infoString;
    notification.soundName = NSUserNotificationDefaultSoundName;
    
    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];

}


- (void)timerHandle
{
    
    
    t--;
    NSString *tipString = [NSString stringWithFormat:@"%ld", (long)t];
    [self.tipTextField setStringValue:tipString];
    
    if (t == 0) {
        [currentTimer invalidate];
        currentTimer = nil;
        
        
        [self.tipTextField setStringValue:tipString];

        [self sendNotificationsCenter];
    }
    
}

- (IBAction)startTimer:(id)sender
{
    
    
    if (currentTimer) {
        [currentTimer invalidate];
        currentTimer = nil;
    }
    
    
    NSInteger time = [self.timeTextField integerValue] * 60;
    
    t = time;
    currentTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
}



@end
