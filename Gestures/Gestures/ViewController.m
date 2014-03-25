//
//  ViewController.m
//  Gestures
//
//  Created by Wei Fang on 3/25/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "ViewController.h"

#define kOriginWidth 195.0
#define kOriginHeight 128.0
#define kOriginX 63.0
#define kOriginY 318.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)foundTap:(id)sender {
    self.outputLabel.text = @"Tapped";
}

- (IBAction)foundSwipe:(id)sender {
     self.outputLabel.text = @"Swiped";
}

- (IBAction)foundPinch:(id)sender {
    UIPinchGestureRecognizer *recognizer;
    NSString *feedback;
    
    recognizer = (UIPinchGestureRecognizer*) sender;
    self.imageView.transform=CGAffineTransformMakeRotation(0.0);
    feedback=[[NSString alloc] initWithFormat:@"Pinched, scale:%1.2f, Velocity:%1.2f", recognizer.scale, recognizer.velocity];
    self.outputLabel.text = feedback;
    self.imageView.frame=CGRectMake(kOriginX,kOriginY,kOriginWidth*recognizer.scale,kOriginHeight*recognizer.scale);
    
}

- (IBAction)foundRotation:(id)sender {
    UIRotationGestureRecognizer *recognizer;
    NSString *feedback;
    
    recognizer = (UIRotationGestureRecognizer*) sender;
    self.imageView.transform=CGAffineTransformMakeRotation(recognizer.rotation);
    feedback=[[NSString alloc] initWithFormat:@"Rotated, rotation:%1.2f", recognizer.rotation];
    self.outputLabel.text = feedback;
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion==UIEventSubtypeMotionShake) {
        self.outputLabel.text=@"Shaking things up";
        self.imageView.transform=CGAffineTransformMakeRotation(0.0);
        self.imageView.frame=CGRectMake(kOriginX, kOriginY, kOriginWidth, kOriginHeight);
    }
}

@end
