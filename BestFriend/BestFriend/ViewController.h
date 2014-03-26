//
//  ViewController.h
//  BestFriend
//
//  Created by Wei Fang on 3/26/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import <Twitter/Twitter.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,MFMailComposeViewControllerDelegate,MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) MKPlacemark *zipAnnotation;

- (IBAction)sendEmail:(id)sender;
- (IBAction)sendTweet:(id)sender;
- (IBAction)newBFF:(id)sender;

- (void)centerMap:(NSString*)zipCode showAddress:(NSDictionary*)fullAddress;
@end
