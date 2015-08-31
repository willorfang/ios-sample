//
//  TeamViewController.m
//  LeagueManager
//
//  Created by Wei Fang on 8/28/15.
//  Copyright (c) 2015 Wei Fang. All rights reserved.
//

#import "TeamViewController.h"
#import "MasterViewController.h"
#import "AppDelegate.h"

@interface TeamViewController ()

@end

@implementation TeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.team != nil) {
        self.nameTextEdit.text = [self.team valueForKey:@"name"];
        self.uniformColorTextEdit.text = [self.team valueForKey:@"uniformColor"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id)initWithMasterController:(MasterViewController *)aMasterController team: (NSManagedObject *)aTeam {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if ((self = [storyboard instantiateViewControllerWithIdentifier:@"TeamViewController"]))
    {
        _masterController = aMasterController;
        _team = aTeam;
    }
    return self;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    if (self.masterController != nil) {
        // modify
        if (self.team != nil) {
            [self.team setValue:self.nameTextEdit.text forKey:@"name"];
            [self.team setValue:self.uniformColorTextEdit.text forKey:@"uniformColor"];
            // Save the context
            [(AppDelegate*)[[UIApplication sharedApplication] delegate] saveContext];
            
        // insert
        } else {
            [self.masterController insertTeamWithName:self.nameTextEdit.text uniformColor:self.uniformColorTextEdit.text];
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
