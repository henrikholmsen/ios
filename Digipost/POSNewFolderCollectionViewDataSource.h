//
//  POSNewFolderCollectionViewDataSource.h
//  Digipost
//
//  Created by Håkon Bogen on 27.05.14.
//  Copyright (c) 2014 Posten. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "POSFolderIcon.h"

@interface POSNewFolderCollectionViewDataSource : NSObject

@property (nonatomic, strong) NSArray *items;

- (id)initAsDataSourceForCollectionView:(UICollectionView *)collectionView;
- (POSFolderIcon *)objectAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathForFolderIconWithName:(NSString *)name;
@end
