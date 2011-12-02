//
//  View.h
//  Dec01
//
//  Created by cunycis on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView{
    
    UIView *obj[3];
    //    UIView *obj2;
    CGFloat sx,sy,genrand;
    CGPoint movexy;
    int prev[3], score;
    UILabel *scorelabel;
    UILabel *instrlabel;
    int onscreen;
    
}
- (CGPoint)direction: (UIView *) dObj withPrev: (int) i;
- (void) score: null;
- (void) move: (CADisplayLink *) displayLink;

@end
