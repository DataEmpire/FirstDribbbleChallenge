//
//  FDCMantleBase.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/13/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCMantleBase.h"

@implementation FDCMantleBase

- (instancetype)initWithClassPropertyType: (ClassePropertyType) type {
    self = [super init];
    
    if(self)
    {
        
    }
    
    return self;
}


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [NSDictionary mtl_identityPropertyMapWithModel:self.class];
}


+ (NSDictionary *) JSONKeyPathsByPropertyKeyCamelCase {
    return nil;
}

+ (NSDictionary *) JSONKeyPathsByPropertyKeyLowerCase {
    return nil;
}

+ (NSDictionary *) JSONKeyPathsByPropertyKeyUnderLineSeparations {
    return nil;
}


-(NSDictionary*)asDictError:(NSError**)error{
    return  [MTLJSONAdapter JSONDictionaryFromModel:self error:error];
}

+(instancetype)parse:(NSDictionary*)dc error:(NSError**)error{
    return [MTLJSONAdapter modelOfClass:self.class
                     fromJSONDictionary:dc
                                  error:error];
}



@end

//@implementation BKMBaseMantleObj (Collections)
//
////+(NSArray*)asArrayOfDictFromModelArray:(NSArray*)objects error:(NSError**)error{
////    return [MTLJSONAdapter JSONArrayFromModels:objects  error:error];
////}
////
////+(NSArray*)parseArray:(NSArray*)objs error:(NSError**)error{
////    return [MTLJSONAdapter modelsOfClass:self.class
////                           fromJSONArray:objs
////                                   error:error];
////}
////
////@end