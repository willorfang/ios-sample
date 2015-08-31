//
//  PlayerListViewController.m
//  LeagueManager
//
//  Created by Wei Fang on 8/31/15.
//  Copyright (c) 2015 Wei Fang. All rights reserved.
//

#import "PlayerListViewController.h"
#import "MasterViewController.h"

@interface PlayerListViewController ()

@end

@implementation PlayerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [(NSSet *)[self.team valueForKey:@"players"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
    // configure
    NSManagedObject *player = [[self sortPlayers] objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[player valueForKey:@"firstName"] description], [[player valueForKey:@"lastName"] description]];
    
    cell.detailTextLabel.text = [[player valueForKey:@"email"] description];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id)initWithMasterController:(MasterViewController*)aMasterController team:(NSManagedObject *)aTeam {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if ((self = [storyboard instantiateViewControllerWithIdentifier:@"PlayerListViewController"]))
    {
        _masterController = aMasterController;
        _team = aTeam;
    }
    return self;
}

- (void)showPlayerView {
    
}

- (NSArray *)sortPlayers {
    NSSortDescriptor *sortLastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortLastNameDescriptor, nil];
    return [[(NSSet *)[self.team valueForKey:@"players"] allObjects] sortedArrayUsingDescriptors:sortDescriptors];
}

@end
