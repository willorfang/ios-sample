//
//  MasterViewController.m
//  FlowerDetail
//
//  Created by Wei Fang on 3/24/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self createFlowerData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.flowerSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.flowerData objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.flowerSections objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerCell"];

    cell.textLabel.text = [[[self.flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [[[self.flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"url"];
    cell.imageView.image = [UIImage imageNamed:
                            [[[self.flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"picture"]
                            ];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.detailViewController=segue.destinationViewController;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailViewController.detailItem=[[self.flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

- (void) createFlowerData {
    NSMutableArray *redFlowers;
    NSMutableArray *blueFlowers;
    
    self.flowerSections=[[NSArray alloc] initWithObjects:@"Red Flowers", @"Blue Flowers", nil];
    redFlowers=[[NSMutableArray alloc] init];
    blueFlowers=[[NSMutableArray alloc] init];
    
    [redFlowers addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"Poppy",@"name",
                           @"poppy.jpg", @"picture",
                           @"http://en.wikipedia.org/wiki/Poppy", @"url", nil]];
    [redFlowers addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"Tulip",@"name",
                           @"tulip.jpg", @"picture",
                           @"http://en.wikipedia.org/wiki/Tulip", @"url", nil]];
    
    [blueFlowers addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"Hyacinth",@"name",
                           @"hyacinth.jpg", @"picture",
                           @"http://en.m.wikipedia.org/wiki/Hyacinth_(flower)", @"url", nil]];
    [blueFlowers addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"Hydrangea",@"name",
                            @"hydrangea.jpg", @"picture",
                            @"http://en.m.wikipedia.org/wiki/Hydrangea", @"url", nil]];
    self.flowerData=[[NSArray alloc] initWithObjects:redFlowers, blueFlowers, nil];
}


@end
