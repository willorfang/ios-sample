//
//  ViewController.m
//  Flashlight
//
//  Created by Wei Fang on 3/24/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // load preferences from disk
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.toggleSwitch.on = [userDefaults boolForKey:kOnOffToggle];
    self.brightnessSlider.value = [userDefaults floatForKey:kBrightnessLevel];
 
    if ([self.toggleSwitch isOn]) {
        self.lightSource.alpha = self.brightnessSlider.value;
    } else {
        self.lightSource.alpha = 0.0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setLightSourceAlphaValue:(id)sender {
    // update preferences to disk
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:self.toggleSwitch.on forKey:kOnOffToggle];
    [userDefaults setFloat:self.brightnessSlider.value forKey:kBrightnessLevel];
    [userDefaults synchronize];
    
    if ([self.toggleSwitch isOn]) {
        self.lightSource.alpha = self.brightnessSlider.value;
    } else {
        self.lightSource.alpha = 0.0;
    }
}
@end
