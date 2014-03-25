//
//  ViewController.h
//  ReturnMe
//
//  Created by Wei Fang on 3/25/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

-(void) setValuesFromPreferences;
@end
