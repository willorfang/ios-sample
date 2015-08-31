//
//  MasterViewController.h
//  LeagueManager
//
//  Created by Wei Fang on 8/28/15.
//  Copyright (c) 2015 Wei Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)insertTeamWithName:(NSString *)name uniformColor:(NSString *)uniformColor;
- (IBAction)showTeamView:(id)sender;

@end

