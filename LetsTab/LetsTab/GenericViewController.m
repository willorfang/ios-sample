//
//  GenericViewController.m
//  LetsTab
//
//  Created by Wei Fang on 3/6/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()

@end

@implementation GenericViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementCountOne:(id)sender {
    ((CountingTabBarController*)self.parentViewController).firstCount++;
    [self updateBadge];
    [self updateCounts];
}

- (IBAction)incrementCountTwo:(id)sender {
    ((CountingTabBarController*)self.parentViewController).secondCount++;
    [self updateBadge];
    [self updateCounts];
}

- (IBAction)incrementCountThree:(id)sender {
    ((CountingTabBarController*)self.parentViewController).thirdCount++;
    [self updateBadge];
    [self updateCounts];
}

- (void) updateCounts {
    NSString* string = [NSString stringWithFormat:
                        @"First: %d\nSecond: %d\nThird: %d",
                        ((CountingTabBarController*)self.parentViewController).firstCount,
                        ((CountingTabBarController*)self.parentViewController).secondCount,((CountingTabBarController*)self.parentViewController).thirdCount];
    self.outputLabel.text = string;
    
}

- (void) updateBadge {
    int currentBadge = [self.barItem.badgeValue intValue];
    currentBadge++;
    self.barItem.badgeValue = [NSString stringWithFormat:@"%d", currentBadge];
}

@end
