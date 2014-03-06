//
//  EditorViewController.h
//  MultiScene
//
//  Created by Wei Fang on 3/4/14.
//  Copyright (c) 2014 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)dismissEditor:(id)sender;
- (IBAction)editDone:(id)sender;
- (IBAction)viewTouchDown:(id)sender;

@end
