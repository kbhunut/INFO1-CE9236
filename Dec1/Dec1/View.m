//
//  View.m
//  Dec01
//
//  Created by cunycis on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        onscreen = 3;
        //create obj[0]
        frame = CGRectMake((self.bounds.size.height-10)/2, (self.bounds.size.width-10)/2, 12, 12);
        obj[0] = [[UIView alloc] initWithFrame:frame];
        obj[0].backgroundColor = [UIColor redColor];
        [self addSubview:obj[0]];
        
        //create obj2
        frame = CGRectMake(self.bounds.size.height, self.bounds.size.width, 10, 10);
        obj[1] = [[UIView alloc] initWithFrame:frame];
        obj[1].backgroundColor = [UIColor whiteColor];
        [self addSubview:obj[1]];
        //create obj3
        frame = CGRectMake(0, 0, 15, 15);
        obj[2] = [[UIView alloc] initWithFrame:frame];
        obj[2].backgroundColor = [UIColor blackColor];
        [self addSubview:obj[2]];
        
        //create label
        
        scorelabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width, self.bounds.size.height-200, 100, 15)];
        scorelabel.textAlignment = UITextAlignmentCenter;
        scorelabel.backgroundColor = [UIColor clearColor];
        scorelabel.textColor = [UIColor whiteColor];
        [self addSubview:scorelabel];
        
        instrlabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 400, 20)];
        instrlabel.textAlignment = UITextAlignmentLeft;
        instrlabel.backgroundColor = [UIColor clearColor];
        instrlabel.textColor = [UIColor whiteColor];
        instrlabel.font = [UIFont fontWithName:@"Helvetica" size:(14)];
        [self addSubview:instrlabel];
        instrlabel.text = [NSString stringWithFormat: @"White +20,+50pt |===| Black: -50pt, Swipe ⇅⇆to play"];
        //move by x,y pixel
        
        sx = 2;
        sy = 2;
        
        //init prev = 0 then any gusture will change
        
        for (int z = 0;z<=onscreen;z++)
            prev[z] = 0;
        
        score = 0;
        
        
        //allocate gesture for UP Down Left Right
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(handleswipeFrom:)
                                                ];
        recognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer: recognizer];
        
        recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(handleswipeFrom:)
                      ];
        recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer: recognizer];
        
        recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(handleswipeFrom:)
                      ];
        recognizer.direction = UISwipeGestureRecognizerDirectionUp;
        [self addGestureRecognizer: recognizer];
        
        recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(handleswipeFrom:)
                      ];
        recognizer.direction = UISwipeGestureRecognizerDirectionDown;
        [self addGestureRecognizer: recognizer];
        
        
    }
    return self;
}


-(void) handleswipeFrom: (UISwipeGestureRecognizer *) recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight){
        prev[0] = 3;
    }else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft){
        prev[0] = 2;
    }else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp){
        prev[0] = 1;
    }else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown){
        prev[0] = 0;
    }
    
    //NSLog(@"Swipe Detected");
}
- (CGPoint)direction: (UIView *) dObj withPrev: (int) i
{
    CGPoint rtnvalue;
    if (prev[i] == 0){
        rtnvalue.x = dObj.center.x;
        rtnvalue.y = dObj.center.y+sy;
    }else if (prev[i] ==1) {
        rtnvalue.x = dObj.center.x;
        rtnvalue.y = dObj.center.y-sy;
    }else if (prev[i] ==2) {
        rtnvalue.x = dObj.center.x - sx;
        rtnvalue.y = dObj.center.y;
    }else if (prev[i] ==3){
        rtnvalue.x = dObj.center.x + sx;
        rtnvalue.y = dObj.center.y;
    }
    
    if (rtnvalue.x>self.bounds.size.width){
        rtnvalue.x=0;
    }else if (rtnvalue.y>self.bounds.size.height){
        rtnvalue.y=0;
    }else if (rtnvalue.x<0) {
        rtnvalue.x = self.bounds.size.width;
    }else if (rtnvalue.y<0) {
        rtnvalue.y = self.bounds.size.height;
    }
    
    return rtnvalue;
    
}
- (void) score: null
{
    
    scorelabel.text = [NSString stringWithFormat: @"Score: %d", score];
    if(CGRectIntersectsRect(obj[0].frame, obj[1].frame)|| CGRectIntersectsRect(obj[1].frame,obj[0].frame)){
        
        NSLog(@"Cat Eat Mouse");
        obj[1].center =CGPointMake(0,0);
        
        if (sx <=2)
            if (score ==0)
                score = 20;
            else 
                score+=20;
            else
                score+=50;
        
        if (score > 0)
            sy = sx = sx+1;
        
        
    }
    
    if(CGRectIntersectsRect(obj[0].frame, obj[2].frame) || CGRectIntersectsRect(obj[2].frame,obj[0].frame)){
        
        NSLog(@"Dog Eat Cat");
        obj[0].center =CGPointMake(0,0);
        score=score-50;
        if (sy > 1)
            sy = sx = sx-1;
        
    }
    
}

- (void) move: (CADisplayLink *) displayLink
{
    
    movexy = [self direction:obj[0] withPrev:0];
    obj[0].center = CGPointMake(movexy.x,movexy.y);
    
    
    
    for (int i = 1; i<onscreen; i++)
    {
        genrand = rand()%100;
        if (genrand<=3)
            prev[i] = genrand;
        
        movexy = [self direction:obj[i] withPrev:i];
        obj[i].center = CGPointMake(movexy.x,movexy.y);
        
        
    }
    
    [self score: NULL];
    
    
    // NSLog(@"x: %g , y: %g",movexy.x,movexy.y);
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
