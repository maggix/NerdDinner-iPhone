//
//  MapAnnotationDefault.h
//  NerdDinner
//
//  Created by Giovanni Maggini on 23/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "NerdDinners.h"

@interface MapAnnotationDefault : NSObject <MKAnnotation>

@property (nonatomic, retain) NerdDinner_Models_Dinner *dinner;


@end
