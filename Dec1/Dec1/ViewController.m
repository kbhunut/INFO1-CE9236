//
//  ViewController.m
//  Dec01
//
//  Created by cunycis on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "View.h"
@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    self.view = [[View alloc] initWithFrame:frame];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    displayLink = [CADisplayLink displayLinkWithTarget:self.view selector: @selector(move:)];
    displayLink.frameInterval = 1;
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [displayLink addToRunLoop:loop forMode:NSDefaultRunLoopMode];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(void) dealloc {
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [displayLink removeFromRunLoop:loop forMode:NSDefaultRunLoopMode];
    
}
@end
