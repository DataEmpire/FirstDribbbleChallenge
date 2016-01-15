//
//  FDCMantleBaseSpec.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/15/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <TLJsonFactory/TLJsonFactory.h>
#import <OCMock/OCMock.h>
#import <Mantle/MTLJSONAdapter.h>

#import "FDCMantleBase.h"

@interface FDCMantleBase ()
+ (NSDictionary *) convertDictionaryPropertiesToJsonProperties;
+ (NSString *)convertPropertyClassToJSONProperty:(NSString *)propertyName toEscape:(NSString *)escapeString;
@end

SpecBegin(FDCMantleBaseSpec)

describe(@"FDCMantleBase", ^{
    it(@"should be able to convert a class property into a valid json property name", ^{
        NSString *jsonProperty = [FDCMantleBase convertPropertyClassToJSONProperty:@"isAnimated" toEscape:@"_"];
        
        expect(jsonProperty).toNot.beNil;
        expect(jsonProperty).equal(@"is_animated");
    });
    
    it(@"should conform with MTLJSONSerializing", ^{
        expect([FDCMantleBase class]).conformTo(@protocol(MTLJSONSerializing));
    });
    
    it(@"should call all corrects methods on JSONKeyPathsByPropertyKey", ^{
        id mock = OCMClassMock([FDCMantleBase class]);
        
        [FDCMantleBase JSONKeyPathsByPropertyKey];
        
        OCMVerify([mock convertDictionaryPropertiesToJsonProperties]);
        OCMVerify([mock customJSONKeyPathsByPropertyKey]);
    });
    
    it(@"should return a non nil dictionary", ^{
        NSDictionary *dictionary = [FDCMantleBase JSONKeyPathsByPropertyKey];
        
        expect(dictionary).notTo.beNil;
    });
    
});

SpecEnd