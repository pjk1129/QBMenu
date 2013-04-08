//
//  LeftViewController.m
//  QBMenu
//
//  Created by JK.PENG on 13-4-7.
//  Copyright (c) 2013年 NJUT. All rights reserved.
//

#import "LeftViewController.h"
#import "QBMenuController.h"
#import "AppDelegate.h"
#import "TestViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_dataList;
}

@property (nonatomic, retain) UITableView *tableView;

@end

@implementation LeftViewController
@synthesize tableView = _tableView;

- (void)dealloc{
    [_tableView release];
    [_dataList release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _dataList = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    
    [self.tableView reloadData];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [_dataList objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    QBMenuController *menuController = (QBMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    
    TestViewController *controller = [[TestViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%d",[indexPath row]];    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [menuController setRootController:navController animated:YES];
    [controller release];
    [navController release];


}

#pragma mark - getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
