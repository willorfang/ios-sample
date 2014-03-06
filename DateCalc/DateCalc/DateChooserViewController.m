//
//  DateChooserViewController.m
//  DateCalc
//
//  Created by Wei Fang on 3/6/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import "DateChooserViewController.h"

@interface DateChooserViewController ()

@end

@implementation DateChooserViewController

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
    self.names = [NSArray arrayWithObjects:@"1.png", @"2.png", @"3.png", @"4.png", @"5.png", @"6.png", @"7.png", @"8.png", nil];
    self.sounds = [NSArray arrayWithObjects:@"cat", @"dog", @"fish", @"snake", @"cock", @"cow", nil];
    self.images = [NSMutableArray array];
    for (int i=0; i!=[self.names count]; i++) {
        NSString* imageName = self.names[i];
        [self.images addObject:[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]]];
    }
    self.labels = [NSMutableArray array];
    for (int i=0; i!=[self.sounds count]; i++) {
        NSString* labelName = self.sounds[i];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
        label.backgroundColor = [UIColor clearColor];
        label.text = labelName;
        [self.labels addObject:label];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [self.names count];
    } else if (component == 1) {
        return [self.sounds count];
    } else {
        return 0;
    }
}

- (UIView*) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    if (component == 0) {
        return self.images[row];
    } else if (component == 1) {
        return self.labels[row];
    } else {
        return nil;
    }
}

- (CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 55.0;
}

- (CGFloat) pickerView:(UIPickerView *)pickerView widthHeightForComponent:(NSInteger)component {
    if (component == 0) {
        return 75.0;
    } else {
        return 150.0;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    ViewController* initialView = (ViewController*)self.delegate;
    NSString* componentName;
    NSString* animalName;
    NSString* soundName;
    if (component == 0) {
        int soundIndex = [pickerView selectedRowInComponent:1];
        componentName = @"The Animal";
        animalName = self.names[row];
        soundName = self.sounds[soundIndex];
    } else {
        int animalIndex = [pickerView selectedRowInComponent:0];
        componentName = @"The Sound";
        animalName = self.names[animalIndex];
        soundName = self.sounds[row];
    }
    [initialView displayAnimal:animalName withSound:soundName fromComponent:componentName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dismissDateChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) viewWillDisappear:(BOOL)animated {
    ((ViewController*)self.delegate).dateChooserVisiable = NO;
}


@end
