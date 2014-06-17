//
//  SHCReceiptFolderTableViewDataSource.m
//  Digipost
//
//  Created by Håkon Bogen on 14.05.14.
//  Copyright (c) 2014 Shortcut. All rights reserved.
//

#import "SHCReceiptFolderTableViewDataSource.h"
#import "POSReceiptFolderTableViewCell.h"
#import "POSReceipt.h"
#import "POSModelManager.h"

@import CoreData;
@interface SHCReceiptFolderTableViewDataSource ()

@property (nonatomic, strong) NSMutableDictionary *receiptGroups;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation SHCReceiptFolderTableViewDataSource
#pragma mark - UITableViewDataSource

- (void)refreshContent
{
    self.receiptGroups = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [[POSModelManager sharedManager] receiptEntity];

    NSArray *objects = [[POSModelManager sharedManager].managedObjectContext executeFetchRequest:fetchRequest
                                                                                           error:nil];
    NSMutableDictionary *mutableReceipts = [NSMutableDictionary dictionary];

    for (POSReceipt *receipt in objects) {
        if (mutableReceipts[receipt.franchiseName] == nil) {
            NSMutableArray *array = [NSMutableArray array];
            [array addObject:receipt];
            mutableReceipts[receipt.franchiseName] = array;
        } else {
            NSMutableArray *array = mutableReceipts[receipt.franchiseName];
            [array addObject:receipt];
        }
    }
    self.receiptGroups = mutableReceipts;
}
- (NSInteger)numberOfReceiptGroups
{
    return [self.receiptGroups count];
}

- (NSString *)storeNameAtIndexPath:(NSIndexPath *)indexPath
{
    return self.receiptGroups.allKeys[indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

    //    if (number == 0) {
    //        [self showTableViewBackgroundView:YES];
    //    }

    //    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.receiptGroups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *storeName = self.receiptGroups.allKeys[indexPath.row];
    NSArray *receipts = self.receiptGroups[storeName];
    POSReceiptFolderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"receiptFolderCell"
                                                                          forIndexPath:indexPath];
    cell.franchiseNameLabel.text = storeName;
    cell.numberOfReceiptsLabel.text = [NSString stringWithFormat:NSLocalizedString(@"RECEIPTS_FOLDER_NUMBER_OF_RECEIPTS_LABEL", @"%i kvitteringer"), [receipts count]];

    return cell;
}

@end
