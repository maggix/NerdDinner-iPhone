//
//  LocationDetailViewController.h
//  NerdDinner
//
//  Created by Giovanni Maggini on 10/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageViewController.h"
#import "NerdDinners.h"

@interface LocationDetailViewController : PageViewController

@property (nonatomic, retain) NerdDinner_Models_Dinner *selectedDinner;

- (id)initWithDinner:(NerdDinner_Models_Dinner*)dinner;

@end
