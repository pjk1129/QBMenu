//
//  QBMenuController.h
//  Path
//
//  Created by JK.PENG on 13-3-14.
//  Copyright (c) 2013年 NJUT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    QBMenuPanDirectionLeft = 0,
    QBMenuPanDirectionRight,
} QBMenuPanDirectionE;

typedef enum {
    QBMenuPanCompletionLeft = 0,
    QBMenuPanCompletionRight,
    QBMenuPanCompletionRoot,
} QBMenuPanCompletionE;

@class QBMenuController;

@protocol QBMenuControllerDelegate <NSObject>
@optional
- (void)menuController:(QBMenuController*)controller willShowViewController:(UIViewController*)controller;

@end


@interface QBMenuController : UIViewController<UIGestureRecognizerDelegate>{
    CGFloat _panOriginX;
    CGPoint _panVelocity;
    
    QBMenuPanDirectionE _panDirection;
    
    struct {
        unsigned int respondsToWillShowViewController:1;
        unsigned int showingLeftView:1;
        unsigned int showingRightView:1;
        unsigned int canShowRight:1;
        unsigned int canShowLeft:1;
    } _menuFlags;
    
}
@property(nonatomic, assign) id <QBMenuControllerDelegate> delegate;
@property(nonatomic, retain) UIViewController *leftViewController;
@property(nonatomic, retain) UIViewController *rightViewController;
@property(nonatomic, retain) UIViewController *rootViewController;

- (id)initWithRootViewController:(UIViewController*)controller;

- (void)setRootController:(UIViewController *)controller animated:(BOOL)animated; // used to push a new controller on the stack
- (void)showRootController:(BOOL)animated; // reset to "home" view controller
- (void)showRightController:(BOOL)animated;  // show right
- (void)showLeftController:(BOOL)animated;  // show left

@end
