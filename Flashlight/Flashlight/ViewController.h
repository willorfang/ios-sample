//
//  ViewController.h
//  Flashlight
//
//  Created by Wei Fang on 3/24/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kOnOffToggle @"onOff"
#define kBrightnessLevel @"brightness"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *lightSource;
@property (strong, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (strong, nonatomic) IBOutlet UISlider *brightnessSlider;

- (IBAction)setLightSourceAlphaValue:(id)sender;
@end
