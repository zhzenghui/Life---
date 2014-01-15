//
//  ZHDBData.h
//  Dyrs
//
//  Created by mbp  on 13-9-9.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FMDatabase.h"

#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { DLog(@"Failure on line %d", __LINE__); abort(); } }


#define ImageType_Dept                  0
#define ImageType_Case                  1
#define ImageType_Designer_BigAvart     2
#define ImageType_AccessType            3
#define ImageType_Access                4
#define ImageType_Designer_Avart        5


#define Member_Manage     0
#define Member_Designer     1
#define Member_DesignerVIP     2

    

@interface ZHDBData : NSObject
{
    FMDatabase *db;

}

+ (ZHDBData *)share;


- (void)stringToDBSqlString:(NSString *)sqlString;
- (void)insertTable:(NSString *)sql;


#pragma mark - dfbs

- (NSMutableArray *)getNumForModle:(NSString * )modle;
- (NSMutableArray *)getNameForModle:(NSString * )modle Num:(NSString * )num;
- (NSMutableArray *)getNameForModle:(NSString * )modle Num:(NSString * )num name:(NSString *)name;
- (NSMutableArray *)getPics;
- (NSMutableArray *)getPicsForProductId:(NSString *)pro_id;
- (NSMutableArray *)getDetailForProductId:(NSString *)pro_id;
- (NSMutableArray *)getSubCateForCategory:(NSString * )cateId;
- (NSMutableArray *)getProductForCategory:(NSString * )cateId;
- (NSMutableArray *)getProductForSerices:(NSString * )sericesId;
- (void)updatePicDownLoaded:(NSString *)pid;
- (void)deleteAllData;



#pragma mark - iLife

- (NSMutableArray *)getProjectsForPro_id:(NSString * )pro_id;





@end
