//
//  GenericViewController.m
//  LetsNavigate
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

- (IBAction)incrementCount:(id)sender {
    ((CountingViewController*)self.parentViewController).pushCount++;
}

- (void) viewWillAppear:(BOOL)animated {
    NSString* text = [NSString stringWithFormat:@"%d", ((CountingViewController*)self.parentViewController).pushCount];
    self.countLabel.text = text;
}
@end
