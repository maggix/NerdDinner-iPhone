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

@protocol GMAnnotation <MKAnnotation>

@optional
- (NSNumber *)annotationid;

@end

@interface MapAnnotationDefault : NSObject <GMAnnotation>
{
    NSNumber *annotationid;
}
@property (nonatomic, retain) NerdDinner_Models_Dinner *dinner;



@end
