//
//  MainView.h
//  Nov10
//
//  Created by cunycis on 1/1/01.
//  Copyright (c) 2001 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView{
//holds the two subviews we transtion between
NSArray *views;

//index in views of the currently displayed little view: 0 or 1
NSUInteger index;
}
@end
