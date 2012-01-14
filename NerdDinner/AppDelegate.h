//
//  AppDelegate.h
//  NerdDinner
//
//  Created by Giovanni Maggini on 22/12/11.
//  Copyright (c) 2011 Giovanni Maggini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/*  For LLVM 3.0
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;
*/

@property (nonatomic, retain) UIWindow *window;

@property (nonatomic, retain) UINavigationController *navigationController;


@end
