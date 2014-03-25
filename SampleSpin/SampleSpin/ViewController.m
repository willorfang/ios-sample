//
//  ViewController.m
//  SampleSpin
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
@end
