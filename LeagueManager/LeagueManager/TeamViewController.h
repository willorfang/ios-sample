//
//  TeamViewController.h
//  LeagueManager
//
//  Created by Wei Fang on 8/28/15.
//  Copyright (c) 2015 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
@class NSManagedObject;

@interface TeamViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextEdit;
@property (weak, nonatomic) IBOutlet UITextField *uniformColorTextEdit;
@property (nonatomic, strong) NSManagedObject *team;
@property (nonatomic, strong) MasterViewController *masterController;

- (id)initWithMasterController:(MasterViewController *)aMasterController team:  (NSManagedObject *)aTeam;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
