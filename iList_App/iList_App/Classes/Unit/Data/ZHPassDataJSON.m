//
//  ZHPassDataJSON.m
//  NetWork
//
//  Created by mbp  on 13-8-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHPassDataJSON.h"
#import "ZHDBData.h"





ZHPassDataJSON *instanceControl;

@implementation ZHPassDataJSON


+ (ZHPassDataJSON *)share
{
    if (instanceControl == nil)
    {
        instanceControl = [[ZHPassDataJSON alloc] init];
    }
    
    return instanceControl;
}


- (id) init
{
    self = [super init];
    if (self){
    }
    return self;
}



- (void)insertDBFromTableName:(NSString *)tableName columns:(NSArray *)columns data:(NSArray *)dataArray
{
    
    NSMutableString *sqlString = [NSMutableString string];
    
    
    
    for (NSDictionary *dict in dataArray) {
        
        [sqlString appendFormat:@"INSERT INTO %@ (", tableName];

        
        for (NSString *string in columns) {
            if (string == columns.lastObject) {
                [sqlString appendFormat:@"%@" , string];
            }
            else {
                [sqlString appendFormat:@"%@," , string];
            }
        }
        
        
        [sqlString appendString:@")"];
        [sqlString appendString:@"VALUES ("];
        
        
        
        for (NSString *string in columns) {
            if (string == columns.lastObject) {
                [sqlString appendFormat:@"'%@'", [dict objectForKey:string]];
            }
            else {
                [sqlString appendFormat:@"'%@',", [dict objectForKey:string]];
            }
        }
        
        [sqlString appendString:@");"];

    }
    
    [[ZHDBData share] insertTable:sqlString];



}

/*
 
 判断该表数据是否存在后
 
 以   table  为键名的   取得表数据
 
 */
- (void)jsonToTableDB:(NSDictionary *)jsonDict
{
    

    
    NSString *detil = @"product_detil";
    NSArray *detilArray = @[@"detil_id", @"name", @"price", @"product_id", @"standard"];
    [self insertDBFromTableName:detil columns:detilArray data:[jsonDict objectForKey:@"detil"]];

    
    NSString *pic = @"picture";
    NSArray *picArray = @[@"picture_id", @"product_id", @"name", @"type", @"url"];
    [self insertDBFromTableName:pic columns:picArray data:[jsonDict objectForKey:@"picture"]];

    NSString *product = @"product_base";
    NSArray *produtionArray = @[@"cate_id", @"letter", @"number", @"product_id", @"remark", @"series_id"];
    [self insertDBFromTableName:product columns:produtionArray data:[jsonDict objectForKey:@"product"]];



}




- (void)jsonToDB:(NSDictionary *)jsonDict
{
    
    
    dispatch_queue_t queue = dispatch_queue_create("com.ple.queue", NULL);
    dispatch_async(queue, ^(void) {
        

        [self jsonToTableDB:jsonDict];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate performSelector:@selector(passDidFinish)];
            
        });
        
        
    });
    

}





@end
