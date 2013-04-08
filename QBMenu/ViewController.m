//
//  ViewController.m
//  QBMenu
//
//  Created by JK.PENG on 13-4-7.
//  Copyright (c) 2013年 NJUT. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Home";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem  *right = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    self.navigationItem.rightBarButtonItem = right;
    [right release];
}

- (void)push{
    NextViewController  *controller = [[NextViewController alloc] init];
    controller.navigationItem.title = @"二级页面";
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

@end
