//
//  oct20hwAppDelegate.h
//  oct20hw
//
//  Created by cunycis on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;
@interface oct20hwAppDelegate : NSObject <UIApplicationDelegate>{
    View *view;
    UIWindow *window;
}
        
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
