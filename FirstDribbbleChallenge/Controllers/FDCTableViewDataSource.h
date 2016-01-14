//
//  FDCTableViewDataSource.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/13/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//


#import <Bricks/Bricks.h>
#import "FDCSessionManager.h"
#import "FDCShot.h"
#import "FDCSessionManager+Shots.h"
#import "FDCShot.h"

@interface FDCTableViewDataSource : BKBaseTableViewDatasourceAndDelegate

@property (nonatomic) NSMutableArray *shots;
@property (nonatomic) FDCShot* selectedShot;

@end
