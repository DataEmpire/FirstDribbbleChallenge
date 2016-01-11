//
//  FDCUser.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCUser.h"


@implementation FDCUser

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"userId": @"id",
             @"name": @"name",
             @"userName":@"username",
             @"htmlUrl":@"html_url",
             @"avatarUrl":@"avatar_url",
             @"bio":@"bio",
             @"location":@"location",
             @"links":@"links",
             @"bucketsCount":@"buckets_count",
             @"commentsReceivedCount":@"comments_received_count",
             @"followersCount":@"followers_count",
             @"followingsCount":@"followings_count",
             @"likesCount":@"likes_count",
             @"likesReceivedCount":@"likes_received_count",
             @"projectsCount":@"projects_count",
             @"reboundsReceivedCount":@"rebounds_received_count",
             @"shotsCount":@"shots_count",
             @"teamsCount":@"teams_count",
             @"canUploadShot":@"can_upload_shot",
             @"type":@"type",
             @"pro":@"pro",
             @"bucketsUrl":@"buckets_url",
             @"followersUrl":@"followers_url",
             @"followingUrl":@"following_url",
             @"likesUrl":@"likes_url",
             @"projectsUrl":@"projects_url",
             @"shotsUrl":@"shots_url",
             @"teamsUrl":@"teams_url",
             @"createdAt":@"created_at",
             @"updatedAt":@"updated_at"
             };
}

@end
