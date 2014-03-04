//
//  ViewController.m
//  GettingAttention
//
//  Created by Wei Fang on 3/4/14.
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

- (IBAction)doAlert:(id)sender {
    UIAlertView* alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"Alert Button Selected"
                   message:@"I need your attetion NOW!"
                   delegate:nil
                   cancelButtonTitle:@"Ok"
                   otherButtonTitles:nil];
    [alertDialog show];
}

- (IBAction)doMultiButtonAlert:(id)sender {
    UIAlertView* alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"Alert Button Selected"
                   message:@"I need your attention NOW!"
                   delegate:self
                   cancelButtonTitle:@"Ok"
                   otherButtonTitles:@"Maybe later", @"Never", nil];
    [alertDialog show];
}

- (IBAction)doAlertInput:(id)sender {
    UIAlertView* alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"Email address"
                   message:@"Please enter your email address:"
                   delegate:self
                   cancelButtonTitle:@"Ok"
                   otherButtonTitles:nil];
    alertDialog.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertDialog show];
}

- (IBAction)doActionSheet:(id)sender {
    UIActionSheet* actionSheet;
    actionSheet = [[UIActionSheet alloc]
                   initWithTitle:@"Avalable Actions"
                   delegate:self
                   cancelButtonTitle:@"Cancel"
                   destructiveButtonTitle:@"Destroy"
                   otherButtonTitles:@"Negotiate", @"Compromise", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showFromRect:[(UIButton*)sender frame] inView:self.view animated:YES];
}

- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    NSString* soundFile = [[NSBundle mainBundle]
                           pathForResource:@"soundeffect" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    NSString* soundFile = [[NSBundle mainBundle]
                           pathForResource:@"alertsound" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString* viewTitle = [alertView title];
    if ([viewTitle isEqualToString:@"Email address"]) {
        self.outputLabel.text = [[alertView textFieldAtIndex:0] text];
    } else if ([viewTitle isEqualToString:@"Alert Button Selected"]) {
        NSString* buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
        if ([buttonTitle isEqualToString:@"Maybe later"]) {
            self.outputLabel.text = @"Clicked 'Maybe later'";
        } else if ([buttonTitle isEqualToString:@"Never"]) {
            self.outputLabel.text = @"Clicked 'Never'";
        } else {
            self.outputLabel.text = @"Clicked 'Ok'";
        }
    }
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString* buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Destroy"]) {
        self.outputLabel.text = @"Clicked 'Destroy'";
    } else if ([buttonTitle isEqualToString:@"Negotiate"]) {
        self.outputLabel.text = @"Clicked 'Negotiate'";
    } else if ([buttonTitle isEqualToString:@"Compromise"]) {
        self.outputLabel.text = @"Clicked 'Compromise'";
    } else {
        self.outputLabel.text = @"Clicked 'Cancel'";
    }
}

@end
