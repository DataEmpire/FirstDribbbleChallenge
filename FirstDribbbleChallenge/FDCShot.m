//
//  FDCShot.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCShot.h"

@implementation FDCShot

+ (NSDictionary *)customJSONKeyPathsByPropertyKey {
    
    NSDictionary *ex = @{
                         @"shotId":@"id",
                         @"shotDescription":@"description"};
    
    return ex;
}


//+ (NSDictionary *)JSONKeyPathsByPropertyKey {
//    
//    return @{
//             @"shotId": @"id",
//             @"user": @"user",
//             @"team":@"team",
//             @"imageUrls":@"images",
//             @"title": @"title",
//             @"shotDescription": @"description",
//             @"width": @"width",
//             @"height": @"height",
//             @"viewsCount": @"views_count",
//             @"likesCount": @"likes_count",
//             @"commentsCount": @"comments_count",
//             @"attachmentsCount": @"attachments_count",
//             @"reboundsCount": @"rebounds_count",
//             @"bucketsCount": @"buckets_count",
//             @"createdAt": @"created_at",
//             @"updatedAt": @"updated_at",
//             @"htmlUrl": @"html_url",
//             @"attachmentsUrl": @"attachments_url",
//             @"bucketsUrl": @"buckets_url",
//             @"commentsUrl": @"comments_url",
//             @"likesUrl": @"likes_url",
//             @"projectsUrl": @"projects_url",
//             @"reboundsUrl": @"rebounds_url",
//             @"animated": @"animated",
//             @"tags":@"tags"
//             };
//}

- (NSString *) getImageURL {
    
    if(!isEmpty(self.images.normal))
        return self.images.normal;
    
    return self.images.hidpi;
}

//Mudar essa funcao de lugar
static inline BOOL isEmpty(id thing) {
    return thing == nil
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

@end