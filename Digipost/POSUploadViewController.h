//
//  POSUploadViewController.h
//  Digipost
//
//  Created by Håkon Bogen on 04.09.14.
//  Copyright (c) 2014 Posten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POSUploadViewController : UIViewController
@property (nonatomic, strong) NSURL *url;
@property (nonatomic) BOOL isShowingFolders;
extern NSString *const kStartUploadingDocumentNotitification;
@end
