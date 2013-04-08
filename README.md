QBMenu

Created by JK.Peng

QBMenuController is a similar menu controller to the one found in Facebook and Path 2.0 on iOS.
Allows for panning like Path 2.0, as well as a left or right view.
Built using NO ARC, and currently supports iPhone and iPod Touch running iOS 5.0 and higher. 

# Installation

Just add QBMenuController.m/h into your project.

# How to implement

QBMenuController is a subclass of UINavigationController, so you can push and pop views the same.
If a left or right view is revealed and push is called, 
the menu controller will animate to it nicely from the revealed state. 
Creating a menu controller is the same as a UINavigationController with two additional properties, 
leftController and rightController. 
If either or both of these is set a button will be created on the nav for it and panning will be enabled.

  #import "QBMenuController.h"

	// create the content view controller
	UIViewController *contentController = [[UIViewController alloc] init];
	
	// create a QBMenuController setting the content as the root
    QBMenuController *menuController = [[QBMenuController alloc] initWithRootViewController:mainController];

	//If need left, set the left view controller property of the menu controller
    UIViewController *leftController = [[UIViewController alloc] init];
    menuController.leftController = leftController;

	//if need right, set the right view controller property of the menu controller
    UIViewController *rightController = [[UIViewController alloc] init];
    menuController.rightController = rightController;

# Demo
======
