//
//  PlayerViewController.m
//  LeagueManager
//
//  Created by Wei Fang on 9/8/15.
//  Copyright (c) 2015 Wei Fang. All rights reserved.
//

#import "PlayerViewController.h"
#import "MasterViewController.h"
#import "AppDelegate.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (id)initWithMasterController:(MasterViewController *)aMasterController team: (NSManagedObject *)aTeam player:(NSManagedObject *)aPlayer {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if ((self = [storyboard instantiateViewControllerWithIdentifier:@"PlayerViewController"]))
    {
        _masterController = aMasterController;
        _team = aTeam;
        _player = aPlayer;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.player != nil) {
        self.firstName.text = [self.player valueForKey:@"firstName"];
        self.lastName.text = [self.player valueForKey:@"lastName"];
        self.email.text = [self.player valueForKey:@"email"];
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


- (IBAction)save:(id)sender {
    if (self.masterController != nil) {
        if (self.player != nil) {
            [self.player setValue:self.firstName.text forKey:@"firstName"];
            [self.player setValue:self.lastName.text forKey:@"lastName"];
            [self.player setValue:self.email.text forKey:@"email"];
            [(AppDelegate*)[[UIApplication sharedApplication] delegate] saveContext];
        } else {
            [self.masterController insertPlayerWithTeam:self.team
                                              firstName:self.firstName.text
                                               lastName:self.lastName.text
                                                  email:self.email.text];
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)confirmDelete:(id)sender {
    if (self.player != nil) {
        UIActionSheet *confirm = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Player" otherButtonTitles:nil];
        confirm.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        [confirm showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0 && self.masterController != nil) {
        // The Delete button was clicked
        [self.masterController deletePlayer:self.player];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
