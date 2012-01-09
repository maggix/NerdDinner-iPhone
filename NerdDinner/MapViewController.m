//
//  MapViewController.m
//  NerdDinner
//
//  Created by Giovanni Maggini on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "MapAnnotationDefault.h"



//
// Adapter category on NSDictionary to make it obey the MKAnnotation protocol
//
@implementation NSDictionary (Annotations)


- (NSString *)title
{
	return [self objectForKey:@"title"];
}

- (NSString *)subtitle
{
	return [self objectForKey:@"description"];
}

- (CLLocationCoordinate2D)coordinate
{
	return CLLocationCoordinate2DMake(
                                      [[self objectForKey:@"latitude"] floatValue],
                                      [[self objectForKey:@"longitude"] floatValue]);
}

@end
 


@implementation MapViewController
@synthesize mapView;
@synthesize detailViewController;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (id)initWithSelectedResult:(NerdDinner_Models_Dinner *)aResult
                  allResults:(NSArray *)allResults{
    self = [super init];
    if (self) {
        selectedResult = [aResult retain];
		results = [allResults retain];
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
     */

//    
//    for (id<MKAnnotation> annotation in mapView.annotations) {
//        [mapView removeAnnotation:annotation];
//    }
    
    // Do any additional setup after loading the view from its nib.
    for (NerdDinner_Models_Dinner *aResult in results)
	{
       
		NSDictionary *resultLocation = [NSDictionary dictionaryWithObjectsAndKeys:[aResult getLatitude],@"latitude",[aResult getLongitude],@"longitude",[aResult getTitle],@"title", [aResult getDescription], @"description", nil];//  [aResult objectForKey:@"stationLocation"];
        //Per usare il Dictionary è necessario implementare 
        
        //MapAnnotationDefault *resultAnnotation = [[[MapAnnotationDefault alloc] init] autorelease];
        //resultAnnotation.dinner = aResult;

         
        //NSLog(@"resultlocation: %@",resultLocation);
		if (resultLocation)
		{
			[mapView addAnnotation:(id<MKAnnotation>)resultLocation];
            NSLog(@"Aggiunto annotazione %@", resultLocation);
		}
	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    mapView = nil;
}

- (void)dealloc
{
    mapView.delegate = nil;
    [selectedResult release];
	[results release];
	
	[super dealloc];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark Map View Delegate methods

- (void)showDetails:(id)sender
{
    // the detail view does not want a toolbar so hide it
    [self.navigationController setToolbarHidden:YES animated:NO];
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}
    /*
- (void)mapView:(MKMapView *)map regionDidChangeAnimated:(BOOL)animated
{

    NSArray *oldAnnotations = mapView.annotations;
    [mapView removeAnnotations:oldAnnotations];
    
    NSArray *weatherItems = [weatherServer weatherItemsForMapRegion:mapView.region maximumCount:4];
    [mapView addAnnotations:weatherItems];

}
     */

    /*
- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{

    static NSString *AnnotationViewID = @"annotationViewID";
    
    WeatherAnnotationView *annotationView =
    (WeatherAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    if (annotationView == nil)
    {
        annotationView = [[[WeatherAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID] autorelease];
    }
    
    annotationView.annotation = annotation;
    
    return annotationView;

}
     */
/*
- (MKAnnotationView *)mapView:(MKMapView *)mv viewForAnnotation:(id <MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil; 
    
    NSString *annotationIdentifier = @"PinViewAnnotation"; 
    
    MKPinAnnotationView *pinView = (MKPinAnnotationView *) [mapView 
                                                            dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    
    
    if (!pinView) 
    {
        pinView = [[[MKPinAnnotationView alloc] 
                    initWithAnnotation:annotation 
                    reuseIdentifier:annotationIdentifier] autorelease];
        
        [pinView setPinColor:MKPinAnnotationColorGreen];
        pinView.animatesDrop = YES; 
        pinView.canShowCallout = YES; 
        
//        UIImageView *houseIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"house.png"]];
//        pinView.leftCalloutAccessoryView = houseIconView; 
//        [houseIconView release];        
        UIImageView *houseIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"house.png"]];
        [houseIconView setFrame:CGRectMake(0, 0, 30, 30)];
        pinView.leftCalloutAccessoryView = houseIconView; 
        [houseIconView release];        
 
    }
    else 
    {
        pinView.annotation = annotation;
    }
    
    return pinView; 
    
}
 */


/*
//http://www.highoncoding.com/Articles/804_Introduction_to_MapKit_Framework_for_iPhone_Development.aspx
- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D userCoordinate = userLocation.location.coordinate; 
    
    for(int i = 1; i<=5;i++) 
    {
        CGFloat latDelta = rand()*.035/RAND_MAX -.02;
        CGFloat longDelta = rand()*.03/RAND_MAX -.015;
        
        CLLocationCoordinate2D newCoord = { userCoordinate.latitude + latDelta, userCoordinate.longitude + longDelta };
        MapPoint *mp = [[MapPoint alloc] initWithCoordinate:newCoord title:[NSString stringWithFormat:@"Azam Home %d",i] subTitle:@"Home Sweet Home"];    
        [mv addAnnotation:mp]; 
        [mp release];
        
    }
}
 */

/*
 //Se si usa questo metodo, usare UNA SOLA ANNOTATION per l'intera mappa
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{    
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id<MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate] ,250,250);
    
    [mv setRegion:region animated:YES];
}
*/

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    MKPinAnnotationView *newAnnotationPin = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"simpleAnnotation"] autorelease];
    newAnnotationPin.pinColor = MKPinAnnotationColorGreen; // Or Red/Green
    newAnnotationPin.animatesDrop = YES;
    newAnnotationPin.canShowCallout = YES;
    return newAnnotationPin;
}


@end
