//
//  TimeData.m
//  iLife
//
//  Created by i-Bejoy on 14-1-6.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "TimeData.h"

@implementation TimeData
- (id)initWithTitle:(NSString*)title rating:(float)rating {
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}
@end
