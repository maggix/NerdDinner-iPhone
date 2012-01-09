//
//  MasterViewController.h
//  NerdDinner
//
//  Created by Giovanni Maggini on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
{
//    NSArray *resultArray;
    
    UISegmentedControl *segmentedControlTopBar;
    
    
    NSArray			*listContent;			// The master content.
	NSMutableArray	*filteredListContent;	// The content filtered as a result of a search.
    
    // The saved state of the search UI if a memory warning removed the view.
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;
}

/* For LLVM 3.0
@property (strong, nonatomic) DetailViewController *detailViewController;
*/

//@property (nonatomic, retain) DetailViewController *detailViewController;
@property (nonatomic, retain) MapViewController *mapViewController;
//@property (nonatomic, retain) NSArray *resultArray;

@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic, retain) NSMutableArray *filteredListContent;

//saved state
@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;


@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControlTopBar;




@end
