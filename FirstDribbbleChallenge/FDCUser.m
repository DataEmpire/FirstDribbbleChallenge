//
//  FDCUser.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCUser.h"


@implementation FDCUser

+(NSDictionary *)customJSONKeyPathsByPropertyKey
{
    return @{
             @"userId": @"id",
             @"userName":@"username",
             };
}

@end
