//
//  ViewController.h
//  DateCalc
//
//  Created by Wei Fang on 3/6/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "DateChooserViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean dateChooserVisiable;

- (IBAction)showDateChooser:(id)sender;
- (void) displayAnimal:(NSString*)chosenAnimal withSound:(NSString*)chosenSound fromComponent:(NSString*)chosenComponent;
@end
