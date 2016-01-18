//
//  FDCUser.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCMantleBase.h"
#import "FDCLinks.h"

@interface FDCUser : FDCMantleBase

#pragma mark - Model BOOL
@property (nonatomic) BOOL canUploadShot;
@property (nonatomic) BOOL pro;

#pragma mark - Model Numbers
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *bucketsCount;
@property (nonatomic, strong) NSNumber *shotsCount;
@property (nonatomic, strong) NSNumber *teamsCount;
@property (nonatomic, strong) NSNumber *followersCount;
@property (nonatomic, strong) NSNumber *followingsCount;
@property (nonatomic, strong) NSNumber *likesCount;
@property (nonatomic, strong) NSNumber *likesReceivedCount;
@property (nonatomic, strong) NSNumber *projectsCount;
@property (nonatomic, strong) NSNumber *commentsReceivedCount;
@property (nonatomic, strong) NSNumber *reboundsReceivedCount;

#pragma mark - Model Strings
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *htmlUrl;
@property (nonatomic, copy) NSString *avatarUrl;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *type;
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
