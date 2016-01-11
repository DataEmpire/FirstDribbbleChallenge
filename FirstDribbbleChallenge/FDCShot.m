//
//  FDCShot.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCShot.h"
#import "FDCUser.h"

@implementation FDCShot

-(instancetype) initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error
{
    self = [super initWithDictionary:dictionaryValue error:error];
    
    if(self)
    {
        
    }
    
    return self;
}


+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"shotId": @"id",
             @"user": @"user",
             @"team":@"team",
             @"imageUrls":@"images",
             @"title": @"title",
             @"shotDescription": @"description",
             @"width": @"width",
             @"height": @"height",
             @"viewsCount": @"views_count",
             @"likesCount": @"likes_count",
             @"commentsCount": @"comments_count",
             @"attachmentsCount": @"attachments_count",
             @"reboundsCount": @"rebounds_count",
             @"bucketsCount": @"buckets_count",
             @"createdAt": @"created_at",
             @"updatedAt": @"updated_at",
             @"htmlUrl": @"html_url",
             @"attachmentsUrl": @"attachments_url",
             @"bucketsUrl": @"buckets_url",
             @"commentsUrl": @"comments_url",
             @"likesUrl": @"likes_url",
             @"projectsUrl": @"projects_url",
             @"reboundsUrl": @"rebounds_url",
             @"animated": @"animated",
             @"tags":@"tags"
             };
}


@end
