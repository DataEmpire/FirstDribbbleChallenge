//
//  FDCShot.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "FDCUser.h"
#import "FDCImageUrls.h"

@interface FDCShot : MTLModel<MTLJSONSerializing>

#pragma mark - Model Boolean
@property (nonatomic) BOOL animated;


#pragma mark - Model Numbers
@property (nonatomic, strong) NSNumber *shotId;
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *viewsCount;
@property (nonatomic, strong) NSNumber *likesCount;
@property (nonatomic, strong) NSNumber *commentsCount;
@property (nonatomic, strong) NSNumber *attachmentsCount;
@property (nonatomic, strong) NSNumber *reboundsCount;
@property (nonatomic, strong) NSNumber *bucketsCount;

#pragma mark - Model Strings
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *shotDescription;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSString *htmlUrl;
@property (nonatomic, copy) NSString *attachmentsUrl;
@property (nonatomic, copy) NSString *bucketsUrl;
@property (nonatomic, copy) NSString *commentsUrl;
@property (nonatomic, copy) NSString *likesUrl;
@property (nonatomic, copy) NSString *projectsUrl;
@property (nonatomic, copy) NSString *reboundsUrl;

#pragma mark - Model Objects
@property (nonatomic, strong) FDCUser *user;
@property (nonatomic, strong) FDCUser *team;
@property (nonatomic, strong) FDCImageUrls *imageUrls;
@property (nonatomic, strong) NSArray *tags;

@end
