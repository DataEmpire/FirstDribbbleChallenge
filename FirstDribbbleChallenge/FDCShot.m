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
    return @{
             @"shotId":@"id",
             @"shotDescription":@"description"
             };
}

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