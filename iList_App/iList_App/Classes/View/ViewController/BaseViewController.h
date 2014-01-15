//
//  BaseViewController.h
//  Dyrs
//
//  Created by mbp  on 13-8-22.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{


}



@property(nonatomic, retain) UIView  *baseView;


@property(nonatomic, assign) int indexNum;

@property (nonatomic, strong) User *user;


@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) UILabel *subTitleLabel;

@property(nonatomic, retain) UIButton *rightButton;
@property(nonatomic, retain) UIViewController *currentViewController;
@property(nonatomic, retain) NSMutableArray *viewControllerArray;




@property(nonatomic, strong) NSMutableArray *dataMArray;
@property(nonatomic, strong) NSMutableDictionary *dataMDict;




- (void)resetBlackTitle;
- (void)resetWhiteTitle;


- (void)back:(UIButton *)button;
- (void)addBackView;
- (void)backToView:(UIButton *)button;


- (void)addMemu;

@end
