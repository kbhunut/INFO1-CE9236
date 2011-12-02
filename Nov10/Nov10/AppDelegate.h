//
//  AppDelegate.h
//  Nov10
//
//  Created by cunycis on 1/1/01.
//  Copyright (c) 2001 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    MainView *mainview;
    UIWindow *_window;
}
@property (strong, nonatomic) UIWindow *window;

@end
