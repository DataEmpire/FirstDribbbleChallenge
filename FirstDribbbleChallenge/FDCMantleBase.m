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
        self.scape = @"_";
    }
    
    return self;
}

- (NSString *)convertPropertyClassToJSONProperty:(NSString *)propertyName toEscape:(NSString *)escapeString {
    NSString *pattern = [NSString stringWithFormat:kPatternStringToConverter, escapeString];
    
    return nil;
}

- (NSDictionary *) convertDictionaryPropertiesToJsonProperties: (NSDictionary *) baseDictionary toEscape:(NSString *) escapeSting
{
    NSMutableDictionary *newDictonary = [NSMutableDictionary dictionaryWithDictionary:baseDictionary];
    for(id key in newDictonary )
    {
        newDictonary[key] = [self convertPropertyClassToJSONProperty:key toEscape:self.scape];
        NSLog(@"%@", newDictonary[key]);
    }
    return [NSDictionary dictionaryWithDictionary:newDictonary];
}

-(NSDictionary*)asDictError:(NSError**)error{
    return  [MTLJSONAdapter JSONDictionaryFromModel:self error:error];
}

+(instancetype)parse:(NSDictionary*)dc error:(NSError**)error{
    return [MTLJSONAdapter modelOfClass:self.class
                     fromJSONDictionary:dc
                                  error:error];
}


-(instancetype) init
{
    return [self initWithJsonScapeProperty:kDefaultScape];
}

- (instancetype)initWithJsonScapeProperty:(NSString *) escapeString {
    self = [super init];
    if(self){
        self.scape = escapeString;
    }
    return self;
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
