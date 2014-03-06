//
//  GenericViewController.h
//  LetsNavigate
//
//  Created by Wei Fang on 3/6/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountingViewController.h"

@interface GenericViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
- (IBAction)incrementCount:(id)sender;

@end
