//
//  StyleStructureController.h
//  TTStyleBuilder
//
//  Created by Keith Lazuka on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleBuilderGlobal.h"
#import "NewObjectPickerController.h"  // needed for the NewObjectPickerDelegate protocol

@class StyleStructureDataSource;

@interface StyleStructureController : TTTableViewController <NewObjectPickerDelegate>
{
    StyleStructureDataSource *styleDataSource;  // same as the TTTableViewController dataSource property
    TTView *previewView;
}

- (id)initWithHeadStyle:(TTStyle *)style;    // designated initializer

@end
