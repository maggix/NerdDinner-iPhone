//
//  MapViewController.h
//  NerdDinner
//
//  Created by Giovanni Maggini on 22/12/11.
//  Copyright (c) 2011 Giovanni Maggini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "NerdDinners.h"


@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    MKMapView *mapView;
    NSArray *results;
    NerdDinner_Models_Dinner *selectedResult;
    CLLocationManager *locationManager;


}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

- (id)initWithSelectedResult:(NerdDinner_Models_Dinner *)aResult
                  allResults:(NSArray *)allResults;

@property (nonatomic,retain) IBOutlet UIBarButtonItem *buttonLat;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *buttonLon;

@end
