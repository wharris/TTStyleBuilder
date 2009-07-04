//
//  MainMenuController.m
//  TTStyleBuilder
//
//  Created by Keith Lazuka on 6/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainMenuController.h"
#import "StyleStructureController.h"
#import "StyleSheetController.h"

@interface MainMenuController ()
- (void)showCreateNewStyle;
- (void)showExploreStylesheet;
- (void)showLoadFromDisk;
@end

@implementation MainMenuController

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark UIViewController

- (void)loadView
{
    [super loadView];
    self.title = @"Main Menu";
    self.tableView = [[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped] autorelease];
	self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark TTTableViewController

- (id<TTTableViewDataSource>)createDataSource
{
    return [TTListDataSource dataSourceWithObjects:
            [[[TTTableField alloc] initWithText:@"Create New Style"] autorelease],
            [[[TTTableField alloc] initWithText:@"Explore a Stylesheet"] autorelease],
            [[[TTTableField alloc] initWithText:@"Load From Disk"] autorelease],
            nil];
}

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath*)indexPath
{
    // examine the selected cell text and dispatch to the appropriate method
    // to display the desired screen.
    NSDictionary *dispatchTable = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSValue valueWithPointer:@selector(showCreateNewStyle)], @"Create New Style",
                                   [NSValue valueWithPointer:@selector(showExploreStylesheet)], @"Explore a Stylesheet",
                                   [NSValue valueWithPointer:@selector(showLoadFromDisk)], @"Load From Disk",
                                   nil];
    
    SEL selector = [[dispatchTable objectForKey:[object text]] pointerValue];
    [self performSelector:selector];
}

- (void)showCreateNewStyle
{
//    TTStyle *styleToBeEdited = TTSTYLE(badge);
    TTStyle *styleToBeEdited = [[[TTStyle alloc] initWithNext:nil] autorelease];
    UIViewController *controller = [[StyleStructureController alloc] initWithHeadStyle:styleToBeEdited];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (void)showExploreStylesheet
{
    UIViewController *controller = [[StyleSheetController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (void)showLoadFromDisk
{
    [self alert:@"Not yet implemented"];
}


@end




















