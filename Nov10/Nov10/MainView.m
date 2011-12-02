//
//  MainView.m
//  Nov10
//
//  Created by cunycis on 1/1/01.
//  Copyright (c) 2001 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "View01.h"
#import "View02.h"
#import "View03.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget:self action:@selector(swipe:)];
        
        recognizer.direction = UISwipeGestureRecognizerDirectionRight;
        
        [self addGestureRecognizer:recognizer];
        
        recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget:self action:@selector(swipe:)];
        recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:recognizer];
        
        views = [NSArray arrayWithObjects:
                 [[View01 alloc] initWithFrame: self.bounds],
                 [[View02 alloc] initWithFrame: self.bounds],
                 [[View03 alloc] initWithFrame: self.bounds], nil
                 ];
        index = 0;
        [self addSubview:[views objectAtIndex: index]];
        
    }
    return self;
}

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	
	/*
     Assume a swipe has just ended.  A more complicated program could
     distinguish between left vs. rights wipes, and perform a
     UIViewAnimationOptionTransitionFlipFromLeft or a
     UIViewAnimationOptionTransitionFlipFromRight.
     
     In UIViewAnimationOptionTransitionFlipFromLeft, the left edge moves
     to the right, and the right edge moves away from the user and to the
     left.
     */
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        
        NSUInteger newIndex = (index+1)%[views count];	//toggle the index
        
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: 1
                           options: UIViewAnimationOptionTransitionFlipFromLeft                        completion: NULL
         ];
        
        index = newIndex;
        
    }else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft){
        
        NSUInteger newIndex = (index-1)%[views count];	//toggle the index
        if (index==0 && newIndex==0){
            newIndex=[views count]-1;
        }
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: 1
                           options: UIViewAnimationOptionTransitionFlipFromRight
                        completion: NULL
         ];
        
        index = newIndex;
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 
}


@end
