//
//  FDCMantleBase.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/13/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <bricks-Mantle/BKMBaseMantleObj.h>

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
@interface FDCMantleBase : BKMBaseMantleObj

/*! @brief The method that contains all properties that have different names on json property name side. */
+ (NSDictionary *)customJSONKeyPathsByPropertyKey;

/*!
 @brief Changes the scape that is used for separate words on property names.
 @discussion For standard this scape is '_'.
 @remarks This escape is used to marks the end of a break between words.
 */
+ (NSString *)JSONScapeOnConvert;

@end