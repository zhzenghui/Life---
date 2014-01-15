//
//  AddProjectDetailViewController.m
//  iList_App
//
//  Created by zeng hui on 14-1-16.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "AddProjectDetailViewController.h"

@interface AddProjectDetailViewController ()

@end

@implementation AddProjectDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];

//    类别
//    标题 ，
//    备注
    
//    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    self.title = [NSString stringWithFormat: @"添加新%@", [self.dataMDict objectForKey:@"name"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
