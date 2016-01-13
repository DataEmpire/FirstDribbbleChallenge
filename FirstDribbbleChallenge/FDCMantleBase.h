//
//  FDCMantleBase.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/13/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

static NSString *const kPatternToReplacement = @"%@$1";
static NSString *const kDefaultScape = @"_";
/*@!
 @summary
 This class will map all public properties to a Dictionary where the
 Mantle framework will get and make the bind between the properties and json values
 
 That will return 4 types of patterns
 -Camel Case
 -LowerCase
 -Underline separations
 -Same as Json file
 
 The default scape is '_'
 */
@interface FDCMantleBase : MTLModel<MTLJSONSerializing>
@property (nonatomic) NSString *scape;
- (instancetype)initWithJsonScapeProperty:(NSString *) escapeString;
+ (NSDictionary *)customJSONKeyPathsByPropertyKey;

@end
