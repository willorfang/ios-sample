//
//  ViewController.m
//  Swapper
//
//  Created by Wei Fang on 3/25/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "ViewController.h"

#define kDeg2Rad (3.1415926/180.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (BOOL)shouldAutorotate { // > ios 6.0
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations { // > ios 6.0
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation { // > ios 6.0
    return UIInterfaceOrientationPortrait;
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    if (toInterfaceOrientation==UIInterfaceOrientationLandscapeRight) {
        self.view=self.landscapeView;
        self.view.transform=CGAffineTransformMakeRotation(kDeg2Rad*90);
        self.view.bounds=CGRectMake(0.0, 0.0, 480.0, 300.0);
    } else if(toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft) {
        self.view=self.landscapeView;
        self.view.transform=CGAffineTransformMakeRotation(kDeg2Rad*(-90));
        self.view.bounds=CGRectMake(0.0, 0.0, 480.0, 300.0);
    } else if(toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown){
        self.view=self.portraitView;
        self.view.transform=CGAffineTransformMakeRotation(kDeg2Rad*(180));
        self.view.bounds=CGRectMake(0.0, 0.0, 320.0, 460.0);
    } else {
        self.view=self.portraitView;
        self.view.transform=CGAffineTransformMakeRotation(kDeg2Rad*(0));
        self.view.bounds=CGRectMake(0.0, 0.0, 320.0, 460.0);
    }
}

@end
