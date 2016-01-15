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
#import "FDCShot.h"

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
        
        OCMVerify([NSDictionary mtl_identityPropertyMapWithModel:[FDCMantleBase class]]);
        OCMVerify([mock convertDictionaryPropertiesToJsonProperties]);
        OCMVerify([mock customJSONKeyPathsByPropertyKey]);
        
    });
    
    it(@"should return a non nil dictionary", ^{
        NSDictionary *dictionary = [FDCMantleBase JSONKeyPathsByPropertyKey];
        
        expect(dictionary).notTo.beNil;
    });
    
    it(@"should call all correct methods when I have properties on class", ^{
        
        NSDictionary *shotProperties = @{
                                         @"shotId": @"shotId",
                                         @"title": @"title",
                                         @"shotDescription": @"shotDescription",
                                         @"width": @"width",
                                         @"images": @"images",
                                         @"viewsCount": @"viewsCount",
                                         @"likesCount": @"likesCount",
                                         @"commentsCount": @"commentsCount",
                                         @"attachmentsCount": @"attachmentsCount",
                                         @"reboundsCount": @"reboundsCount",
                                         @"bucketsCount": @"bucketsCount",
                                         @"createdAt": @"createdAt",
                                         @"updatedAt": @"updatedAt",
                                         @"htmlUrl": @"htmlUrl",
                                         @"attachments_url": @"attachmentsUrl",
                                         @"bucketsUrl": @"bucketsUrl",
                                         @"commentsUrl": @"commentsUrl",
                                         @"likesUrl": @"likesUrl",
                                         @"projectsUrl": @"projectsUrl",
                                         @"reboundsUrl": @"reboundsUrl",
                                         @"animated": @"animated",
                                         @"tags": @"tags",
                                         @"user": @"user",
                                         @"team": @"team"
                                         };
        
        NSDictionary *shotOverrideProperties = @{
                                                 @"shotId": @"id",
                                                 @"shotDescription": @"description"
                                                 };
        
        id mock = OCMClassMock([FDCMantleBase class]);
        id dictionaryMock = OCMClassMock([NSDictionary class]);
        
        OCMStub([dictionaryMock mtl_identityPropertyMapWithModel:[FDCMantleBase class]]).andReturn(shotProperties);
        OCMStub([mock customJSONKeyPathsByPropertyKey]).andReturn(shotOverrideProperties);
        
        NSDictionary *actual = [FDCMantleBase JSONKeyPathsByPropertyKey];
        
        [shotProperties enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            OCMVerify([mock convertPropertyClassToJSONProperty:key toEscape:@"_"]);
            OCMVerify([mock JSONScapeOnConvert]);
        }];
        
        OCMVerify([mock customJSONKeyPathsByPropertyKey]);
        
        NSDictionary *shotJSONProperties = @{
                                             @"shotId": @"id",
                                             @"title": @"title",
                                             @"shotDescription": @"description",
                                             @"width": @"width",
                                             @"images": @"images",
                                             @"viewsCount": @"views_count",
                                             @"likesCount": @"likes_count",
                                             @"commentsCount": @"comments_count",
                                             @"attachmentsCount": @"attachments_count",
                                             @"reboundsCount": @"rebounds_count",
                                             @"bucketsCount": @"buckets_count",
                                             @"createdAt": @"created_at",
                                             @"updatedAt": @"updated_at",
                                             @"htmlUrl": @"html_url",
                                             @"attachments_url": @"attachments_url",
                                             @"bucketsUrl": @"buckets_url",
                                             @"commentsUrl": @"comments_url",
                                             @"likesUrl": @"likes_url",
                                             @"projectsUrl": @"projects_url",
                                             @"reboundsUrl": @"rebounds_url",
                                             @"animated": @"animated",
                                             @"tags": @"tags",
                                             @"user": @"user",
                                             @"team": @"team"
                                             };
        
        
        
        expect(actual).equal(shotJSONProperties);
    });
    
});

SpecEnd