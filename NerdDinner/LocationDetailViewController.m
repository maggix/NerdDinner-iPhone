//
//  LocationDetailViewController.m
//  NerdDinner
//
//  Created by Giovanni Maggini on 10/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "TextFieldCell.h"

@implementation LocationDetailViewController
@synthesize selectedDinner;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithDinner:(NerdDinner_Models_Dinner*)dinner
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.selectedDinner = dinner;
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Dinner Details", @"");
    
   	[self addSectionAtIndex:0 withAnimation:UITableViewRowAnimationNone];

    [self appendRowToSection:0 cellClass:[TextFieldCell class] 
                    cellData:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              NSLocalizedString(@"Title", @""),
                              @"label",
                              [NSString stringWithFormat:@"%@",[selectedDinner getTitle] ], @"value",
                              NSLocalizedString(@"Value goes here", @""),
                              @"placeholder", 
                              NO, 
                              @"editable",
                              nil]
               withAnimation:UITableViewRowAnimationNone];
}

- (NSString *)tableView:(UITableView *)aTableView
titleForHeaderInSection:(NSInteger)section
{
	if (section == 0)
	{
		return NSLocalizedString(@"Main info", nil);
	}
	else if (section == 1)
	{
		return NSLocalizedString(@"Rows loaded from NIBs", nil);
	}
	else if (section == 2)
	{
		return NSLocalizedString(@"Some editable text fields", nil);
	}
    
	return nil;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
