//
//  ZHDBData.m
//  Dyrs
//
//  Created by mbp  on 13-9-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "ZHDBData.h"
#import "ZHDBControl.h"


ZHDBData *dbData;


@implementation ZHDBData

+ (ZHDBData *)share
{
    if (dbData == nil)
    {
        dbData = [[ZHDBData alloc] init];
    }
    
    return dbData;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        
//        if ([[ZHDBControl share] checkDB]) {            
            NSString *dbPath = nil;
            
            dbPath = [KDocumentDirectory stringByAppendingPathComponent:db_name];
            db = [[FMDatabase alloc]initWithPath:dbPath];
            
//        }
    }
    return self;
}

- (void)dealloc
{
    
    if (![db open]) {
        return;
    }
    db = nil;
}


#pragma mark  命令执行

- (void)insertTable:(NSString *)sql
{
    
    //    create table
    if ([db open]) {
        
        
        NSArray * commands = [sql componentsSeparatedByString:@";"];
        for(NSString * sqlString in commands)
        {
            BOOL res = [db executeUpdate:sqlString];
            if (!res) {
                DLog(@"error===========  %@", sqlString);
            } else {
                DLog(@"succ ");
            }
            
        }
        
        [db close];
    }
    else {
        DLog(@"error=========== when open db");
    }
}



- (void)stringToDBSqlString:(NSString *)sqlString
{
    
    if (!sqlString) {
        return;
    }
    
    if ([db open]) {
        
        bool statue =  [db executeUpdate:
                        sqlString];
        if (statue) {
            
        }
        else {
            DLog(@"statue:%i error: %@", statue, sqlString);
        }
        
    }
    else {
        DLog(@"db Not  open");
    }
}

- (void)dictToDB:(NSDictionary *)dict sqlString:(NSString *)sqlString
{
    if (!sqlString) {
        return;
    }
    
    if ([db open]) {

        bool statue =  [db executeUpdate:
                        sqlString withParameterDictionary:dict];
        
        if (statue) {
        }
        else {
            DLog(@"statue:%i error: %@,  \n lasterror:%@", statue, sqlString, db.lastError);
        }
    }
}


#pragma mark -

- (NSMutableArray *)getNumForModle:(NSString * )modle
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select DISTINCT number from product_base where letter = %@ order by number asc", modle];
    

    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[rs stringForColumn:@"number"] forKey:@"number"];

            
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;

}

- (NSMutableArray *)getNameForModle:(NSString * )modle Num:(NSString * )num
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select pd.product_id, pb.remark pb_remark, pb.letter pb_letter, pb.number pb_number,pd.name pd_name, ct.name ct_name from product_base pb, product_detil pd, category ct WHERE pb.product_id = pd.product_id and  pb.cate_id = ct.cate_id  and pb.letter = %@ and pb.number = %@", modle, num];
    

    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"product_id"]] forKey:@"product_id"];
            [dict setValue:[rs stringForColumn:@"pd_name"] forKey:@"pd_name"];
            [dict setValue:[rs stringForColumn:@"ct_name"] forKey:@"ct_name"];
            [dict setValue:[rs stringForColumn:@"pb_number"] forKey:@"pb_number"];
            [dict setValue:[rs stringForColumn:@"pb_letter"] forKey:@"pb_letter"];
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;
}


- (NSMutableArray *)getNameForModle:(NSString * )modle Num:(NSString * )num name:(NSString *)name
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select  DISTINCT pd.product_id, pb.remark pb_remark, pb.letter pb_letter, pb.number pb_number,pd.name pd_name, ct.name ct_name from product_base pb, product_detil pd, category ct WHERE pb.product_id = pd.product_id and  pb.cate_id = ct.cate_id  and pb.letter = %@ and pb.number = '%@' ", modle, num];
    
    if (name) {
        sqlString = [NSString stringWithFormat:
                      @"select   pd.product_id, pb.remark pb_remark, pb.letter pb_letter, pb.number pb_number,pd.name pd_name, ct.name ct_name from product_base pb, product_detil pd, category ct WHERE pb.product_id = pd.product_id and  pb.cate_id = ct.cate_id  and pb.letter = %@ and pb.number = '%@' and pd.name = '%@'  ", modle, num, name];
    }
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"product_id"]] forKey:@"product_id"];
            [dict setValue:[rs stringForColumn:@"pd_name"] forKey:@"pd_name"];
            [dict setValue:[rs stringForColumn:@"ct_name"] forKey:@"ct_name"];
            [dict setValue:[rs stringForColumn:@"pb_number"] forKey:@"pb_number"];
            [dict setValue:[rs stringForColumn:@"pb_letter"] forKey:@"pb_letter"];
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;
}



- (NSMutableArray *)getPics
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select *  from picture  where statue ISNULL"];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"picture_id"]] forKey:@"id"];
            [dict setValue:[rs stringForColumn:@"url"] forKey:@"url"];
            [dict setValue:[rs stringForColumn:@"name"] forKey:@"name"];
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;
}


- (NSMutableArray *)getPicsForProductId:(NSString *)pro_id
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select *  from picture  where statue = 1 and product_id = %@", pro_id];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"picture_id"]] forKey:@"picture_id"];
            [dict setValue:[rs stringForColumn:@"url"] forKey:@"url"];
            [dict setValue:[rs stringForColumn:@"name"] forKey:@"name"];
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;

}


- (NSMutableArray *)getDetailForProductId:(NSString *)pro_id
{
    
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select pd.standard, pd.name, pd.price, pb.remark   from product_detil pd, product_base pb where pb.product_id = pd.product_id and pd.product_id =  %@", pro_id];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs doubleForColumn:@"price"]] forKey:@"price"];
            [dict setValue:[rs stringForColumn:@"standard"] forKey:@"standard"];
            [dict setValue:[rs stringForColumn:@"name"] forKey:@"name"];
            [dict setValue:[rs stringForColumn:@"remark"] forKey:@"remark"];
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;
    
    
    
}


- (NSMutableArray *)getProductForCategory:(NSString * )cateId
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select   pd.product_id, pb.remark pb_remark, pb.letter pb_letter, pb.number pb_number,pd.name pd_name, ct.name ct_name from product_base pb, product_detil pd, category ct WHERE pb.product_id = pd.product_id and  pb.cate_id = ct.cate_id  and pb.cate_id = %@ GROUP BY pb.product_id", cateId];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"product_id"]] forKey:@"product_id"];
            [dict setValue:[rs stringForColumn:@"pd_name"] forKey:@"pd_name"];
            [dict setValue:[rs stringForColumn:@"ct_name"] forKey:@"ct_name"];
            [dict setValue:[rs stringForColumn:@"pb_number"] forKey:@"pb_number"];
            [dict setValue:[rs stringForColumn:@"pb_letter"] forKey:@"pb_letter"];
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    return dataArray;
}


- (NSMutableArray *)getSubCateForCategory:(NSString * )cateId
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select *  from category  where fid = %@", cateId];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"cate_id"]] forKey:@"cate_id"];
            [dict setValue:[rs stringForColumn:@"name"] forKey:@"name"];
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;
}


- (NSMutableArray *)getProductForSerices:(NSString * )sericesId
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"select   pd.product_id, pb.remark remark,pb.letter pb_letter, pb.number pb_number,pd.name pd_name, ct.name ct_name from product_base pb, product_detil pd, category ct WHERE pb.product_id = pd.product_id and  pb.cate_id = ct.cate_id  and pb.series_id = %@ GROUP BY pb.product_id", sericesId];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"product_id"]] forKey:@"product_id"];
            [dict setValue:[rs stringForColumn:@"pd_name"] forKey:@"pd_name"];
            [dict setValue:[rs stringForColumn:@"ct_name"] forKey:@"ct_name"];
            [dict setValue:[rs stringForColumn:@"pb_number"] forKey:@"pb_number"];
            [dict setValue:[rs stringForColumn:@"pb_letter"] forKey:@"pb_letter"];
            
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;
}







- (void)updatePicDownLoaded:(NSString *)pid
{
    NSString *sqlString = [NSString stringWithFormat:
                           @"update picture set statue = 1 where picture_id = %@", pid];
    
    [self stringToDBSqlString:sqlString];
}




- (void)deleteAllData
{
    NSString *sqlString = [NSString stringWithFormat:
                           @"delete from picture;delete from product_base;delete from product_detil;"];
    
    [self insertTable:sqlString];
    

}



#pragma mark - iLife

- (NSMutableArray *)getProjectsForPro_id:(NSString * )pro_id
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSString *sqlString = [NSString stringWithFormat:
                           @"SELECT id,name, type, id FROM project WHERE fid = %@", pro_id];
    
    
    if (![db open]) {
        
        DLog (@"Could not open db.");
    }
    else {
        
        
        FMResultSet *rs = [db executeQuery:sqlString];
        
        while ([rs next]) {
            
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setValue:[NSNumber numberWithInt:[rs intForColumn:@"id"]] forKey:@"id"];
            [dict setValue:[rs stringForColumn:@"name"] forKey:@"name"];
            [dict setValue:[rs stringForColumn:@"type"] forKey:@"type"];

            
            
            [dataArray addObject:dict];
            
        }
        
        
        [rs close];
        [db close];
        
    }
    
    
    return dataArray;
}

@end
