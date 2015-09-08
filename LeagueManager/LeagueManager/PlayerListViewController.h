//
//  PlayerListViewController.h
//  LeagueManager
//
//  Created by Wei Fang on 8/31/15.
//  Copyright (c) 2015 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
@class NSManagedObject;

@interface PlayerListViewController : UITableViewController

@property (nonatomic, strong) NSManagedObject *team;
@property (nonatomic, strong) MasterViewController *masterController;

- (id)initWithMasterController:(MasterViewController*)aMasterController team:(NSManagedObject *)aTeam;
- (IBAction)showPlayerView:(id)sender;

- (NSArray *)sortPlayers;

@end
