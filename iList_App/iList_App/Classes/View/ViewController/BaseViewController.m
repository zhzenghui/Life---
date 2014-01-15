//
//  BaseViewController.m
//  Dyrs
//
//  Created by mbp  on 13-8-22.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)back:(UIButton *)button
{
    
  
    [UIView animateWithDuration:KMiddleDuration animations:^{
        self.view.alpha  = 0;
    } completion:^(BOOL finished) {
        
        if (finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
            
        }
    }];
    
    

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight|| toInterfaceOrientation == UIDeviceOrientationLandscapeLeft);
}

- (void)resetBlackTitle
{

    
 
    
}








- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view .backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}



-(UIStatusBarStyle)preferredStatusBarStyle{
    if (iOS7) {
        UIImageView *statuebar_gb_ImageView = [[UIImageView alloc] init];
        statuebar_gb_ImageView.frame = CGRectMake(0, 0, 1024, 20);
        statuebar_gb_ImageView.image = [[ImageView share] createSolidColorImageWithColor:[UIColor blackColor] andSize:statuebar_gb_ImageView.frame.size];

        [self.view addSubview:statuebar_gb_ImageView];
    }
    return UIStatusBarStyleLightContent;
}



- (void)loadView
{
    [super loadView];
    

//    
////    if (iOS7) {
////        UIImageView *statuebar_gb_ImageView = [[UIImageView alloc] init];
////        statuebar_gb_ImageView.frame = CGRectMake(0, 0, 1024, 20);
////        statuebar_gb_ImageView.image = [[ImageView share] createSolidColorImageWithColor:[UIColor blackColor] andSize:statuebar_gb_ImageView.frame.size];
////        
////        [self.view addSubview:statuebar_gb_ImageView];
////    }
////    
//    _baseView = [[UIView alloc] initWithFrame:screen_BOUNDS_SIZE];
//    _baseView.backgroundColor = [UIColor blackColor];
//    CGRect r = self.baseView.frame;
//    
//    
//    
//
//    
//    if (isShowStatue) {
//        
//        if (iOS7) {
//            r.origin = CGPointMake(0, 20);
//        }
//        else {
//            r.origin = CGPointMake(0, 0);
//        }
//        r.size = CGSizeMake(screen_Height, screen_Width-20);
//
//        
//    }
//    else {
//        if (iOS7) {
//            r.origin = CGPointMake(0, 0);
//        }
//        else {
//            r.origin = CGPointMake(0, 0);
//        }
//        r.size = CGSizeMake(screen_Height , screen_Width);
//
//    }
//    _baseView.frame = r;
//    [self.view addSubview:_baseView];

}

- (void)addLogo
{
    [[ImageView share] addToView:self.baseView imagePathName:@"logo" rect:RectMake2x(74, 66, 389, 102)];

}


- (void)addBackView
{
    [[Button share] addToView:self.view addTarget:self rect:RectMakeC2x(1869, 102, 110, 110) tag:Action_Back action:@selector(back:) imagePath:@"按钮-返回"];


}

- (void)backToView:(UIButton *)button
{
    UIView *v = [button superview];
    
    [UIView animateWithDuration:KMiddleDuration animations:^{
        v.alpha = 0;
    } completion:^(BOOL finished) {
        [v removeFromSuperview];
    }];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
