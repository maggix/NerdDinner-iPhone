//
//  MasterViewController.m
//  NerdDinner
//
//  Created by Giovanni Maggini on 22/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

//#import "DetailViewController.h"
#import "MapViewController.h"

//OData
#import "WindowsCredential.h"
#import "ACSCredential.h"
#import "ACSUtil.h"
#import "AzureTableCredential.h"
#import "Tables.h"
#import "ODataServiceException.h"
#import "ODataXMlParser.h"
//Service
#import "NerdDinners.h"

//Cells
#import "ApplicationCell.h"
#import "CompositeSubviewBasedApplicationCell.h"
#import "HybridSubviewBasedApplicationCell.h"

// Define one of the following macros to 1 to control which type of cell will be used.
#define USE_INDIVIDUAL_SUBVIEWS_CELL    1	// use a xib file defining the cell
#define USE_COMPOSITE_SUBVIEW_CELL      0	// use a single view to draw all the content
#define USE_HYBRID_CELL                 0	// use a single view to draw most of the content + separate label to render the rest of the content


/*
 Predefined colors to alternate the background color of each cell row by row
 (see tableView:cellForRowAtIndexPath: and tableView:willDisplayCell:forRowAtIndexPath:).
 */
#define DARK_BACKGROUND  [UIColor colorWithRed:151.0/255.0 green:152.0/255.0 blue:155.0/255.0 alpha:1.0]
#define LIGHT_BACKGROUND [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0]


@implementation MasterViewController

//@synthesize detailViewController = _detailViewController;
@synthesize mapViewController = _mapViewController;
//@synthesize resultArray;
@synthesize listContent, filteredListContent;
@synthesize savedSearchTerm, savedScopeButtonIndex, searchWasActive;
@synthesize segmentedControlTopBar;
@synthesize tmpCell, cellNib;



NSString *dinnerURI = @"http://www.nerddinner.com/Services/OData.svc/";

//query con parametri
//http://nerddinner.com/Services/OData.svc/Dinners?$top=200&$skip=150&$orderby=EventDate%20desc
//http://www.odata.org/developers/protocols/uri-conventions

- (void) onAfterReceive:(HttpResponse*)response
{
	NSLog(@"on after receive");
	NSLog(@"http response = %@",[response getMessage]);
}


-(void) retrieveDinners
{
    @try{
    
        NSLog(@"retriving dinners....");
        NerdDinners *proxy=[[NerdDinners alloc]initWithUri:dinnerURI credential:nil];
        
    //	DataServiceQuery *query = [proxy dinners];
    //	//[query top:1];
    //	QueryOperationResponse *response = [query execute];
    //	NSArray *resultArr =[[response getResult] retain];
    //    NSArray *resultArr = [[proxy FindUpcomingDinners] retain]; //??? Returns no results as of 2012-01-12
        NSArray *resultArr =[[proxy GetMostRecentDinners] retain]; //Method with custom OData Query
        [[resultArr reverseObjectEnumerator] allObjects]; //Reversed order if I use my own query
        NSLog(@"resultarray...%d",[resultArr count]);
        for (int i =0;i<[resultArr count]; i++) {
            
            NerdDinner_Models_Dinner *p = [resultArr objectAtIndex:i];
            NSLog(@"=== Dinner %d  ===",i);
            NSLog(@"dinner id...%@",[[p getDinnerID] stringValue]);
            NSLog(@"dinner name...%@",[p getTitle]);
            NSLog(@"dinner desc......%@",[p getDescription]);
            NSLog(@"Date..%@",[p getEventDate]);
    //		NSLog(@"Type..%@",[p getDinnerType]);
            NSLog(@"Latitude..%@",[p getLatitude]);
            NSLog(@"Longitude..%@",[p getLongitude]);
            NSLog(@"==Fine Dinner==");
            
        }
        self.listContent = resultArr;
        self.filteredListContent = [NSMutableArray arrayWithCapacity:[self.listContent count]];
    }
    @catch (DataServiceRequestException * e) 
    {
        NSLog(@"exception = %@,  innerExceptiom= %@",[e name],[[e getResponse] getError]);
    }	
    @catch (ODataServiceException * e) 
    {
        NSLog(@"exception = %@,  \nDetailedError = %@",[e name],[e getDetailedError]);
        
    }	
    @catch (NSException * e) 
    {
        NSLog(@"exception = %@, %@",[e name],[e reason]);
    }
    
    HUD.detailsLabelText = [NSString stringWithFormat: @"Loading Complete"];
    [HUD hide:YES afterDelay:1];
    
    [self.tableView reloadData];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Dinners", @"Dinners");
    }
    return self;
}
							
- (void)dealloc
{
//    [_detailViewController release];
    [_mapViewController release];
    [listContent release];
	[filteredListContent release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Configure the table view.
    self.tableView.rowHeight = 73.0;
    self.tableView.backgroundColor = DARK_BACKGROUND;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.searchDisplayController.searchResultsTableView.rowHeight = 73.0;
    self.searchDisplayController.searchResultsTableView.backgroundColor = DARK_BACKGROUND;
    self.searchDisplayController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //TODO: check functioning
    [self.navigationController.navigationBar addSubview:segmentedControlTopBar];
    
    // create our UINib instance which will later help us load and instanciate the
	// UITableViewCells's UI via a xib file.
	//
	// Note:
	// The UINib classe provides better performance in situations where you want to create multiple
	// copies of a nib file’s contents. The normal nib-loading process involves reading the nib file
	// from disk and then instantiating the objects it contains. However, with the UINib class, the
	// nib file is read from disk once and the contents are stored in memory.
	// Because they are in memory, creating successive sets of objects takes less time because it
	// does not require accessing the disk.
	//
	self.cellNib = [UINib nibWithNibName:@"IndividualSubviewsBasedApplicationCell" bundle:nil];
    
    // restore search settings if they were saved in didReceiveMemoryWarning.
    if (self.savedSearchTerm)
    {
        [self.searchDisplayController setActive:self.searchWasActive];
        [self.searchDisplayController.searchBar setSelectedScopeButtonIndex:self.savedScopeButtonIndex];
        [self.searchDisplayController.searchBar setText:savedSearchTerm];
        
        self.savedSearchTerm = nil;
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [listContent release];
	listContent = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if([listContent count] < 1)
    {
    
        HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:HUD];
        
        HUD.delegate = self;
        HUD.labelText = @"Loading";
        HUD.detailsLabelText = @"Loading Dinners...";
        
        [HUD showWhileExecuting:@selector(retrieveDinners) onTarget:self withObject:nil animated:YES];
        //[HUD show:YES];
        
        /*
        @try 
        {
            //[self checkForInnerError];
            //uncomment to products
            //[self addProductObject];
            
            //[self updateProductObject];
            //[self deleteProductObject];
            
            
            [self retrieveDinners];
            
            self.filteredListContent = [NSMutableArray arrayWithCapacity:[self.listContent count]];
            
            //[self addLink];
            //[self setLink];
            //[self deleteLink];
            
            //[self functionImport];
            
        }
        @catch (DataServiceRequestException * e) 
        {
            NSLog(@"exception = %@,  innerExceptiom= %@",[e name],[[e getResponse] getError]);
        }	
        @catch (ODataServiceException * e) 
        {
            NSLog(@"exception = %@,  \nDetailedError = %@",[e name],[e getDetailedError]);
            
        }	
        @catch (NSException * e) 
        {
            NSLog(@"exception = %@, %@",[e name],[e reason]);
        }	
         */
        

    }
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    
    self.searchWasActive = [self.searchDisplayController isActive];
    self.savedSearchTerm = [self.searchDisplayController.searchBar text];
    self.savedScopeButtonIndex = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //Todo: organizzare per tipo di cestino?
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [resultArray count];
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.filteredListContent count];
    }
	else
	{
        return [self.listContent count];
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    // Configure the cell.
    cell.textLabel.text = NSLocalizedString(@"Detail", @"Detail");
    return cell;
     */
    
    /*
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NerdDinner_Models_Dinner *dinner = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        dinner = [self.filteredListContent objectAtIndex:indexPath.row];
    }
	else
	{
        dinner = [self.listContent objectAtIndex:indexPath.row];
    }
	
    cell.textLabel.text = [dinner getTitle];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    cell.detailTextLabel.text =  [dateFormat stringFromDate:[dinner getEventDate]];
    
//	if([resultArray count] > 0 )
//	{
//        cell.textLabel.text = [[resultArray objectAtIndex:indexPath.row] getTitle];
//		//NetflixCatalog_Model_Title *t = [resultArray objectAtIndex:indexPath.row];
//		//cell.textLabel.text = [t getShortName];
//	}
	return cell;
     */
    
    static NSString *CellIdentifier = @"ApplicationCell";
    
    ApplicationCell *cell = (ApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil)
    {
#if USE_INDIVIDUAL_SUBVIEWS_CELL
        [self.cellNib instantiateWithOwner:self options:nil];
		cell = tmpCell;
		self.tmpCell = nil;
		
#elif USE_COMPOSITE_SUBVIEW_CELL
        cell = [[[CompositeSubviewBasedApplicationCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
		
#elif USE_HYBRID_CELL
        cell = [[[HybridSubviewBasedApplicationCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                         reuseIdentifier:CellIdentifier] autorelease];
#endif
    }
    
	// Display dark and light background in alternate rows -- see tableView:willDisplayCell:forRowAtIndexPath:.
    cell.useDarkBackground = (indexPath.row % 2 == 0);
	
    
    //Get data
    NerdDinner_Models_Dinner *dinner = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        dinner = [self.filteredListContent objectAtIndex:indexPath.row];
    }
	else
	{
        dinner = [self.listContent objectAtIndex:indexPath.row];
    }
	    
	// Configure the data for the cell.
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
//    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
//    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    cell.icon = [UIImage imageNamed:@"Dinner"];
    cell.publisher = [dinner getHostedBy];
    cell.name = [dinner getTitle];
    cell.numRatings = [[dinner getRSVPs] count]; //TODO: get RSVPs correctly
    cell.rating = 1.0f; //TODO: calculate rating based on RSVPs
    cell.price = [dateFormat stringFromDate:[dinner getEventDate]];
	
    //[f release];
    [dateFormat release];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = ((ApplicationCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

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
    /*
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
     */
    NerdDinner_Models_Dinner *dinner = nil;
    NSArray *allresults;
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        dinner = [self.filteredListContent objectAtIndex:indexPath.row];
        allresults = self.filteredListContent;
    }
	else
	{
        dinner = [self.listContent objectAtIndex:indexPath.row];
        allresults = self.listContent;
    }
    self.mapViewController = [[[MapViewController alloc] initWithSelectedResult:dinner allResults:allresults] autorelease];
    
    [self.navigationController pushViewController:self.mapViewController animated:YES];
}



#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	/*
	 Update the filtered array based on the search text and scope.
	 */
	
	[self.filteredListContent removeAllObjects]; // First clear the filtered array.
	
	/*
	 Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
	for (NerdDinner_Models_Dinner *dinner in listContent)
	{
        
        if([[dinner getTitle] rangeOfString:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)].location != NSNotFound)
        {
            [self.filteredListContent addObject:dinner];
        }

        /*
		if ([scope isEqualToString:@"All"])
		{
			NSComparisonResult result0 = [[dinner getTitle] compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            NSComparisonResult result1 = [[dinner getDescription] compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result0 == NSOrderedSame || result1 == NSOrderedSame)
			{
				[self.filteredListContent addObject:dinner];
            }
		}
        else
        {
            NSComparisonResult result = [[dinner getTitle] compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
			{
				[self.filteredListContent addObject:dinner];
            }
        }
         */
	}
}



#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


@end
