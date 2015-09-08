//
//  PlayerViewController.h
//  LeagueManager
//
//  Created by Wei Fang on 9/8/15.
//  Copyright (c) 2015 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class MasterViewController;

@interface PlayerViewController : UIViewController <UIActionSheetDelegate>

@property (nonatomic, retain) IBOutlet UITextField *firstName;
@property (nonatomic, retain) IBOutlet UITextField *lastName;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) NSManagedObject *team;
@property (nonatomic, retain) NSManagedObject *player;
@property (nonatomic, retain) MasterViewController *masterController;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)confirmDelete:(id)sender;

- (id)initWithMasterController:(MasterViewController *)aMasterController team: (NSManagedObject *)aTeam player:(NSManagedObject *)aPlayer;

@end
