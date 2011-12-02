//
//  View.m
//  oct20hw
//
//  Created by cunycis on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect b = self.bounds;
    
    // Drawing code
    UIFont *f = [UIFont fontWithName:@"Verdana-Bold" size:9];
    NSString *s = @"Random Generate Tic Tac Toe";
    CGSize txtSize = [s sizeWithFont: f];
    //NSLog(@"Height: %g , Width: %g", size.height, size.width);
    
    //center the hello world text
    CGPoint p = CGPointMake(((b.size.width-txtSize.width)/2), 0);
    [s drawAtPoint:p withFont:f];

    
    
  
    CGContextRef c = UIGraphicsGetCurrentContext();
    int thick = 10;
    
    
    CGFloat x = b.size.width  / 3;
    
    CGFloat z;
    
    for(int i = 1; i <= 2; i++){
        z = (x*i)-5;
        
        
        CGRect hgrid = CGRectMake(0,z+((b.size.height-b.size.width)/2),b.size.width,thick);
        
        CGRect vgrid = CGRectMake(z,(b.size.height-b.size.width )/ 2,thick,b.size.width);
		CGContextAddRect(c, hgrid);
        CGContextAddRect(c,vgrid); 
        
        
        CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
        CGContextFillPath(c);
    }
    
    
    //display intersection to get the basic cordinate
   x = (b.size.width)  / 6;
   
        for(int d = 1; d<=5; d=d+2){
            
            z = (x*d);
            NSLog(@"x: %g   y: %g", z, z+((b.size.height-b.size.width)/2));
                
            }
            
            
    //FORCE CORDINATE (Brain freeze try to think of alogrithm and function and loop)
    CGPoint box[9];
    box[0] = CGPointMake(53.333, 123.333);
    box[1] = CGPointMake(53.333, 230);    
    box[2] = CGPointMake(53.333, 336.667);
    box[3] = CGPointMake(160, 123.333);
    box[4] = CGPointMake(160, 230);   
    box[5] = CGPointMake(160, 336.667);
    box[6] = CGPointMake(266.667, 123.333);
    box[7] = CGPointMake(266.667, 230);
    box[8] = CGPointMake(266.667, 336.667);
    
    
    //generate x and o

    srand(time(NULL));
    int rand_box[9];
    
    int turn = rand()%2; //generate who goes first x or o
    for(int i=0; i <=8; i++){
        rand_box[i] = rand()%9+1;
        
        if (i!=0){
            int a = 0;
            while (a!=i){
                if (rand_box[i] == rand_box[a]){
                    rand_box[i] = rand()%9+1;
                    a=0; //reset to search from beginning of array again
                }else{
                    a++;
                }
            }
        }
        
        UIFont *xo = [UIFont fontWithName:@"Verdana-Bold" size:20];
        CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 1.0);
                
        if (turn == 0) {
            
            NSLog(@"Box: %d :: Player: %d", rand_box[i], turn);
            NSString *s = @"x";
            //NSLog(@"Height: %g , Width: %g", size.height, size.width);
            
            [s drawAtPoint:box[rand_box[i]-1] withFont:xo];
            
            turn=1;
            
        }else{
            NSLog(@"Box: %d :: Player: %d", rand_box[i], turn);
            NSString *s = @"O";
            //NSLog(@"Height: %g , Width: %g", size.height, size.width);
            
            [s drawAtPoint:box[rand_box[i]-1] withFont:xo];
            turn=0;
            
        }
        
        
        
        
    }
    
    

}

@end
