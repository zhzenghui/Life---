//
//  Method.m
//  NetWork
//
//  Created by mbp  on 13-8-2.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "CommonMethod.h"

static CommonMethod *commonMethod;

@implementation CommonMethod


+ (id)share
{
    if (commonMethod) {
        return commonMethod;
    }
    commonMethod = [[CommonMethod alloc] init];
    return commonMethod;
}

- (id) init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}



- (void)copyData
{
    
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSString *writableDBPath = [KDocumentDirectory stringByAppendingPathComponent:@"files"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"data/files"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        
    }
    
    
    
    NSString *writableDBPath1 = [KDocumentDirectory stringByAppendingPathComponent:db_name];
    
    NSString *dbPath = [NSString stringWithFormat:@"data/%@", db_name];
    NSString *defaultDBPath1 = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:dbPath];
    success = [fileManager copyItemAtPath:defaultDBPath1 toPath:writableDBPath1 error:&error];
    if (!success) {
        
    }
}



@end
