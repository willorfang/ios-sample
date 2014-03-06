//
//  EditorViewController.m
//  MultiScene
//
//  Created by Wei Fang on 3/4/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import "EditorViewController.h"
#import "ViewController.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

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
    self.emailTextField.text = ((ViewController*)self.presentingViewController).emailField.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissEditor:(id)sender {
    ((ViewController*)self.presentingViewController).emailField.text = self.emailTextField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)editDone:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)viewTouchDown:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
