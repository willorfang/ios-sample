//
//  MasterViewController.h
//  FlowerDetail
//
//  Created by Wei Fang on 3/24/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSArray *flowerData;
@property (strong, nonatomic) NSArray *flowerSections;

- (void) createFlowerData;
@end
