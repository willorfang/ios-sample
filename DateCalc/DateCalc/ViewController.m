//
//  ViewController.m
//  DateCalc
//
//  Created by Wei Fang on 3/6/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDateChooser:(id)sender {
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((DateChooserViewController*) segue.destinationViewController).delegate = self;
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if (self.dateChooserVisiable!=YES) {
        [self performSegueWithIdentifier:@"toDateChooser" sender:sender];
        self.dateChooserVisiable = YES;
    }
}

- (void) displayAnimal:(NSString*)chosenAnimal withSound:(NSString*)chosenSound fromComponent:(NSString*)chosenComponent {
    NSString* string = [NSString stringWithFormat:@"You changed %@ (%@ and the sound %@)", chosenComponent, chosenAnimal, chosenSound];
    self.outputLabel.text = string;
}
@end
