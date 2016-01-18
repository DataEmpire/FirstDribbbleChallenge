//
//  FDCLinks.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/15/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <TLJsonFactory/TLJsonFactory.h>
#import <OCMock/OCMock.h>

#import "FDCLinks.h"

SpecBegin(FDCLinksSpec)

describe(@"FDCLinks", ^{
    
    __block FDCLinks *links;
    __block NSError *errorsOnParse;
    
    beforeAll(^{
        NSDictionary *dictionary = [TLJsonFactory tl_jsonDictFromFile:@"Links"];
        
        links = [FDCLinks parse:dictionary error:&errorsOnParse];
    });
    
    it(@"should be able to parse", ^{
        expect(links).toNot.beNil;
    });
    
    it(@"should contain string values", ^{
        expect(links.web).to.beKindOf([NSString class]);
        expect(links.twitter).to.beKindOf([NSString class]);
    });
});

SpecEnd