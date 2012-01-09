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



@implementation MasterViewController

//@synthesize detailViewController = _detailViewController;
@synthesize mapViewController = _mapViewController;
//@synthesize resultArray;
@synthesize listContent, filteredListContent;
@synthesize savedSearchTerm, savedScopeButtonIndex, searchWasActive;
@synthesize segmentedControlTopBar;



NSString *dinnerURI = @"http://www.nerddinner.com/Services/OData.svc/";

- (void) onAfterReceive:(HttpResponse*)response
{
	NSLog(@"on after receive");
	NSLog(@"http response = %@",[response getMessage]);
}


-(void) retrieveDinners
{
	NSLog(@"retriving dinners....");
	NerdDinners *proxy=[[NerdDinners alloc]initWithUri:dinnerURI credential:nil];
	
	DataServiceQuery *query = [proxy dinners];
	//[query top:1];
	QueryOperationResponse *response = [query execute];
	NSArray *resultArr =[[response getResult] retain];
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
    
    HUD.detailsLabelText = [NSString stringWithFormat: @"Loading Complete"];
    [HUD hide:YES afterDelay:1];
    listContent = resultArr;
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
    @try 
	{
		//[self checkForInnerError];
		//uncomment to products
		//[self addProductObject];
		
		//[self updateProductObject];
		//[self deleteProductObject];
        

		
		//[self addLink];
		//[self setLink];
		//[self deleteLink];
		
		//[self functionImport];
        
        [self.navigationController.navigationBar addSubview:segmentedControlTopBar];
        
        // restore search settings if they were saved in didReceiveMemoryWarning.
        if (self.savedSearchTerm)
        {
            [self.searchDisplayController setActive:self.searchWasActive];
            [self.searchDisplayController.searchBar setSelectedScopeButtonIndex:self.savedScopeButtonIndex];
            [self.searchDisplayController.searchBar setText:savedSearchTerm];
            
            self.savedSearchTerm = nil;
        }
		
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
        
        //    [HUD showWhileExecuting:@selector(tryLogin) onTarget:self withObject:nil animated:YES];
        [HUD show:YES];
        
        
        [self retrieveDinners];
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
        NSComparisonResult result0 = [[dinner getTitle] compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        NSComparisonResult result1 = [[dinner getDescription] compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result0 == NSOrderedSame || result1 == NSOrderedSame)
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
