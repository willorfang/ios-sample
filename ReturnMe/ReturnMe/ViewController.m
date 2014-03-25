//
//  ViewController.m
//  ReturnMe
//
//  Created by Wei Fang on 3/25/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "ViewController.h"

#define kName @"name"
#define kEmail @"email"
#define kPhone @"phone"
#define kPickture @"pickture"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setValuesFromPreferences];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setValuesFromPreferences {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *initialDefaults=[[NSDictionary alloc] initWithObjectsAndKeys:@"Dog", kPickture,
                                   @"Your Name", kName, @"you@yours.com", kEmail, @"(555)555-1212", kPhone, nil];
    [userDefaults registerDefaults:initialDefaults];
    
    self.imageView.image=[UIImage imageNamed:@"back.jpg"];
    self.email.text=[userDefaults stringForKey:kEmail];
    self.name.text=[userDefaults stringForKey:kName];
    self.phone.text=[userDefaults stringForKey:kPhone];
}

@end
