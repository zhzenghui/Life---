//
//  ZHViewController.m
//  iList_App
//
//  Created by zeng hui on 1/8/14.
//  Copyright (c) 2014 zeng hui. All rights reserved.
//

#import "ZHViewController.h"
#import "CostViewController.h"
#import "AddProjectDetailViewController.h"

@interface ZHViewController ()

@end

@implementation ZHViewController


#pragma mark -   action
- (void)addProject:(UIButton *)button
{
    
}

- (void)addProject_Detail:(UIButton *)button
{
    UITableViewCell *cell = (UITableViewCell *)[[[button superview] superview] superview];
    
    if (cell) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        AddProjectDetailViewController *apd = [[AddProjectDetailViewController alloc] init];
        apd.dataMDict = [self.dataMArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:apd animated:YES];
    }
    
}

#pragma mark -   view

- (void)loadTable
{
    self.tableView.frame = CGRectMake(0, 0, screen_Width, screen_Height);
    self.dataMArray = [[ZHDBData share] getProjectsForPro_id:@"0"];
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont
                                                                           boldSystemFontOfSize:16], NSFontAttributeName,
                                [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    self.navigationItem.title = @"iLife";
    

    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProject:)];
    

    [self loadTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
}



#pragma mark - action

- (IBAction)openViewController:(id)sender {
    UIButton *button = (UIButton *)sender;
    UIViewController *vc;
    switch (button.tag) {
            case KCostTag:
            vc = [[CostViewController alloc] initWithNibName:@"CostViewController" bundle:nil];
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     // Return the number of rows in the section.
    return self.dataMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIButton *button =[UIButton buttonWithType:UIButtonTypeContactAdd];
        [button setTintColor:[UIColor blackColor]];
        button.frame = CGRectMake(240, 0, 44, 44);
        [button addTarget:self action:@selector(addProject_Detail:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.contentView addSubview:button];
        
        
    }
    
    // Configure the cell...
    NSDictionary *dict = [self.dataMArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CostViewController * vc = [[CostViewController alloc] initWithNibName:@"CostViewController" bundle:nil];
    vc.dataMDict = [self.dataMArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
