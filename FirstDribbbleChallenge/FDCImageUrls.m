//
//  FDCImageUrls.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCImageUrls.h"

@implementation FDCImageUrls

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    
    if (self) {
        
    }
    
    return self;
}



+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"hidpi":@"hidpi",
             @"normal":@"normal",
             @"teaser":@"teaser"
             };
}


@end
