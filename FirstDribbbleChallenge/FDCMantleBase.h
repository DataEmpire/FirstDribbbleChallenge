//
//  FDCMantleBase.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/13/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Mantle/MTLModel.h>
#import <Mantle/NSDictionary+MTLMappingAdditions.h>
#import <Mantle/MTLJSONAdapter.h>

/*!@brief The character that marks other word in the property name on json file. */
static NSString *const kDefaultScape = @"_";

/*! @brief The pattern that is used to represent the property name with a scaped character before it. */
static NSString *const kPatternToReplacement = @"%@$1";

/*! @brief The Regular Expression that matches only letters in upper case. */
static NSString *const kRegexPattern = @"([A-Z])";

/*!
 @brief This class turn more easier the convert of a public property class to a json representation on mantle model.
 
 @discussion 
 It will map all public properties to a NSDictionary where the Mantle framework will get and make the bind between the properties and json properties.
 To turn a behavior of binding class property with json property see the method customJSONKeyPathsByPropertyKey.
 */
@interface FDCMantleBase : MTLModel<MTLJSONSerializing>

/*! 
 @brief Initializes the object and set a custom value for the scape character. 
 @remarks This escape is used to marks the end of a break between words.
 */
- (instancetype)initWithJsonScapeProperty:(NSString *)scape;

/*! @brief The method that contains all properties that have different names on json property name side. */
+ (NSDictionary *)customJSONKeyPathsByPropertyKey;

@end
