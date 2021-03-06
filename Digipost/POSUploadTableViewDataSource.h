//
//  POSUploadTableViewDataSource.h
//  Digipost
//
//  Created by Håkon Bogen on 09.09.14.
//  Copyright (c) 2014 Posten. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class POSMailbox;

@interface POSUploadTableViewDataSource : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate>

// designated initalizer
- (id)initAsDataSourceForTableView:(UITableView *)tableView;
- (id)managedObjectAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, strong) NSString *entityDescription;
@property (nonatomic, strong) POSMailbox *selectedMailbox;

@end
