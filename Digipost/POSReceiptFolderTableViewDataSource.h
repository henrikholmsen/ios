//
//  SHCReceiptFolderTableViewDataSource.h
//  Digipost
//
//  Created by Håkon Bogen on 14.05.14.
//  Copyright (c) 2014 Shortcut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POSReceiptFolderTableViewDataSource : NSObject <UITableViewDataSource>
- (void)refreshContent;
- (NSString *)storeNameAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfReceiptGroups;

@end
