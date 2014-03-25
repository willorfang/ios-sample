//
//  ViewController.h
//  Gestures
//
//  Created by Wei Fang on 3/25/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;

- (IBAction)foundTap:(id)sender;
- (IBAction)foundSwipe:(id)sender;
- (IBAction)foundPinch:(id)sender;
- (IBAction)foundRotation:(id)sender;
@end
