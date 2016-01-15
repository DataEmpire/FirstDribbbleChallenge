//
//  FDCUserSpec.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/15/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <TLJsonFactory/TLJsonFactory.h>
#import <OCMock/OCMock.h>

#import "FDCUser.h"

SpecBegin(FDCUserSpec)

describe(@"FDCUser", ^{
    __block FDCUser *user;
    __block NSError *errosOnParse;
    
    beforeAll(^{
        NSDictionary *dictionary = [TLJsonFactory tl_jsonDictFromFile:@"User"];
        
        user = [FDCUser parse:dictionary error:&errosOnParse];
    });
    
    it(@"should be able to parse", ^{
        expect(user).toNot.beNil;
    });
    
    it(@"should contain links property kind of NSLinks", ^{
        expect(user.links).toNot.beNil;
        expect(user.links).to.beKindOf([FDCLinks class]);
    });
    
    it(@"should be contain a name", ^{
        expect(user.name).toNot.beNil;
        expect(user.name).to.beKindOf([NSString class]);
    });
});

SpecEnd