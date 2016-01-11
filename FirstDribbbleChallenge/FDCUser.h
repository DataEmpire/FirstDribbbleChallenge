//
//  FDCUser.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "FDCLinks.h"

@interface FDCUser : MTLModel<MTLJSONSerializing>


#pragma mark - Model Numbers
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *bucketsCount;
@property (nonatomic, strong) NSString *shotsCount;
@property (nonatomic, strong) NSString *teamsCount;
@property (nonatomic, strong) NSString *followersCount;
@property (nonatomic, strong) NSString *followingsCount;
@property (nonatomic, strong) NSString *likesCount;
@property (nonatomic, strong) NSString *likesReceivedCount;
@property (nonatomic, strong) NSString *projectsCount;
@property (nonatomic, strong) NSString *commentsReceivedCount;
@property (nonatomic, strong) NSString *reboundsReceivedCount;

#pragma mark - Model Strings
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *htmlUrl;
@property (nonatomic, copy) NSString *avatarUrl;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *canUploadShot;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *pro;
@property (nonatomic, copy) NSString *bucketsUrl;
@property (nonatomic, copy) NSString *followersUrl;
@property (nonatomic, copy) NSString *followingUrl;
@property (nonatomic, copy) NSString *likesUrl;
@property (nonatomic, copy) NSString *projectsUrl;
@property (nonatomic, copy) NSString *shotsUrl;
@property (nonatomic, copy) NSString *teamsUrl;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *updatedAt;

#pragma mark - Model Objects
@property (nonatomic, copy) FDCLinks *links;

@end