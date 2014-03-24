//
//  DetailViewController.h
//  FlowerDetail
//
//  Created by Wei Fang on 3/24/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIWebView *detailWebView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
