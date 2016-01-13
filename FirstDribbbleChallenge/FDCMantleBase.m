//
//  FDCMantleBase.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/13/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCMantleBase.h"

@implementation FDCMantleBase

+ (NSDictionary *)customJSONKeyPathsByPropertyKey {
    return nil;
}


+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    
    
    return [self convertDictionaryPropertiesToJsonProperties];
}

+ (NSString *)convertPropertyClassToJSONProperty:(NSString *)propertyName toEscape:(NSString *)escapeString {
    NSString *replaceString = [NSString stringWithFormat:kPatternToReplacement, escapeString];
    NSString *pattern = @"([A-Z])";
    
    NSError *errorOnRegex;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&errorOnRegex];
    
    NSDictionary *customDictionary = [self customJSONKeyPathsByPropertyKey];
    
    NSString *modifiedString = [regex stringByReplacingMatchesInString:propertyName options:0 range:NSMakeRange(0, [propertyName length]) withTemplate:replaceString];
    
    if (customDictionary) {
        NSString *customJSONProperty = [customDictionary objectForKey:propertyName];
        if (customJSONProperty) {
            modifiedString = customJSONProperty;
        }
    }
    
    return [modifiedString lowercaseString];
}

+ (NSDictionary *) convertDictionaryPropertiesToJsonProperties
{
    return [self convertDictionaryPropertiesToJsonProperties:[NSDictionary mtl_identityPropertyMapWithModel:self.class] toEscape:kDefaultScape];
}

+ (NSDictionary *) convertDictionaryPropertiesToJsonProperties: (NSDictionary *) baseDictionary toEscape:(NSString *) escapeSting
{
    NSMutableDictionary *newDictonary = [NSMutableDictionary new];
    
    [baseDictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [newDictonary setObject:[self convertPropertyClassToJSONProperty:key toEscape:escapeSting]forKey:key];
    }];
    
    NSLog(@"%@", newDictonary);
    
    return [NSDictionary dictionaryWithDictionary:newDictonary];
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