//
//  DateChooserViewController.h
//  DateCalc
//
//  Created by Wei Fang on 3/6/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DateChooserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) id delegate;
@property (weak, nonatomic) NSArray* names;
@property (weak, nonatomic) NSArray* sounds;
@property (strong, nonatomic) NSMutableArray* images;
@property (strong, nonatomic) NSMutableArray* labels;

- (IBAction)dismissDateChooser:(id)sender;
@end
