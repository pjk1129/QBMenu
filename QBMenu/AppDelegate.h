//
//  AppDelegate.h
//  QBMenu
//
//  Created by JK.PENG on 13-4-7.
//  Copyright (c) 2013年 NJUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class QBMenuController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (nonatomic, retain) QBMenuController      *menuController;


@end
