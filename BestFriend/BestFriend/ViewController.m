//
//  ViewController.m
//  BestFriend
//
//  Created by Wei Fang on 3/26/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sendEmail:(id)sender {
    MFMailComposeViewController *mailComposer=[[MFMailComposeViewController alloc] init];
    NSArray* addresses=[[NSArray alloc] initWithObjects:self.email.text, nil];
    mailComposer.mailComposeDelegate=self;
    
    [mailComposer setSubject:@"test"];
    [mailComposer setToRecipients:addresses];
    [self presentViewController:mailComposer animated:YES completion:nil];
}

// delegate for MFMailComposeViewControllerDelegate
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendTweet:(id)sender {
    NSLog(@"Not supported after ios 6.0");
}

- (IBAction)newBFF:(id)sender {
    ABPeoplePickerNavigationController *picker=[[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate=self;
    [self presentViewController:picker animated:YES completion:nil];
}

// for ABPeoplePickerNavigationControllerDelegate
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
    // name
    self.name.text=(__bridge NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    
    // address zipcode
    ABMultiValueRef friendAddress=ABRecordCopyValue(person, kABPersonAddressProperty);
    if (ABMultiValueGetCount(friendAddress)>0) {
        NSDictionary* firstAddress=(__bridge NSDictionary*)ABMultiValueCopyValueAtIndex(friendAddress, 0);
        NSString* zipCode=[firstAddress objectForKey:@"ZIP"];
        [self centerMap:zipCode showAddress:firstAddress];
    }
    
    // email
    ABMultiValueRef friendEmail=ABRecordCopyValue(person, kABPersonEmailProperty);
    if (ABMultiValueGetCount(friendEmail)>0) {
        self.email.text=(__bridge NSString*)ABMultiValueCopyValueAtIndex(friendEmail, 0);
    }
    
    // photo
    if (ABPersonHasImageData(person)) {
        self.photo.image=[UIImage imageWithData:(__bridge NSData*)ABPersonCopyImageData(person)];
    }
    
    //dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

- (BOOL) peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    return NO;
}

// show the address in map view
- (void)centerMap:(NSString*)zipCode showAddress:(NSDictionary*)fullAddress {
    // get location from zipcode using google map service
    NSString* queryURL=[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?sensor=false&components=postal_code:%@", zipCode];
    NSString* queryResult=[[NSString alloc]
                           initWithContentsOfURL:[NSURL URLWithString:queryURL]
                           encoding:NSUTF8StringEncoding
                           error:nil];
    // resolve the result
    NSDictionary* jsonData=[NSJSONSerialization
                            JSONObjectWithData:[queryResult dataUsingEncoding:NSUTF8StringEncoding]
                            options:NSJSONReadingMutableContainers
                            error:nil];
    NSDictionary *location = [[[[jsonData objectForKey:@"results"] objectAtIndex:0] objectForKey:@"geometry"] objectForKey:@"location"];
    if (TRUE) {
        // set map region according to query result
        MKCoordinateRegion region;
        region.center.latitude=[[location objectForKey:@"lat"] floatValue];
        region.center.longitude=[[location objectForKey:@"lng"] floatValue];
        region.span.latitudeDelta=0.02;
        region.span.longitudeDelta=0.02;
        [self.map setRegion:region animated:YES];
        
        // add annotation
        if (self.zipAnnotation!=nil) {
            [self.map removeAnnotation:self.zipAnnotation];
        }
        self.zipAnnotation=[[MKPlacemark alloc]
                            initWithCoordinate:region.center
                            addressDictionary:fullAddress];
        [self.map addAnnotation:self.zipAnnotation];
    }
}

- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pinDrop=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myspot"];
    pinDrop.animatesDrop=YES;
    pinDrop.canShowCallout=YES;
    pinDrop.pinColor=MKPinAnnotationColorPurple;
    return pinDrop;
}

@end
