//
//  ViewController.m
//  Reframe
//
//  Created by Wei Fang on 3/25/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "ViewController.h"

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

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait ||
        toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        self.viewLabel.frame=CGRectMake(95.0, 15.0, 130.0, 20.0);
        self.buttonOne.frame=CGRectMake(20.0, 50.0, 280.0, 190.0);
        self.buttonTwo.frame=CGRectMake(20.0, 250.0, 280.0, 190.0);
    } else {
        self.viewLabel.frame=CGRectMake(175.0, 140.0, 130.0, 20.0);
        self.buttonOne.frame=CGRectMake(20.0, 20.0, 440.0, 100.0);
        self.buttonTwo.frame=CGRectMake(20.0, 180.0, 440.0, 100.0);
    }
}

@end
