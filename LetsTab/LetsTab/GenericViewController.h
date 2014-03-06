//
//  GenericViewController.h
//  LetsTab
//
//  Created by Wei Fang on 3/6/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CountingTabBarController.h"

@interface GenericViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITabBarItem *barItem;

- (IBAction)incrementCountOne:(id)sender;
- (IBAction)incrementCountTwo:(id)sender;
- (IBAction)incrementCountThree:(id)sender;
- (void) updateCounts;
- (void) updateBadge;
@end
