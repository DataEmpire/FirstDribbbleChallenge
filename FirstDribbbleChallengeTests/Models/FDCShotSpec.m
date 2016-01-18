//
//  FDCShotSpec.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/14/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <TLJsonFactory/TLJsonFactory.h>
#import <OCMock/OCMock.h>

#import "FDCShot.h"

SpecBegin(FDCShotSpec)

describe(@"FDCShot", ^{
    __block FDCShot *shot;
    __block NSError *errorOnParse;
    
    beforeAll(^{
        NSDictionary *dictionary = [TLJsonFactory tl_jsonDictFromFile:@"Shot"];
        
        shot = [FDCShot parse:dictionary error:&errorOnParse];
    });
    
    it(@"should be able to parse", ^{
        expect(shot).toNot.beNil;
        expect(shot).to.beKindOf([FDCShot class]);
    });
    
    it(@"should contain a user", ^{
        expect(shot.user).toNot.beNil;
        expect(shot.user).to.beKindOf([FDCUser class]);
    });
    
    it(@"should contain a valid number for likes count", ^{
        expect(shot.likesCount).to.beKindOf([NSNumber class]);
        expect(shot.likesCount).to.beGreaterThan(0);
    });
    
    it(@"should contain a set of images", ^{
        expect(shot.images).toNot.beNil;
        expect(shot.images).to.beKindOf([FDCImageUrls class]);
    });
    
    it(@"should contain a NSArray of strings as tags", ^{
        expect(shot.tags).toNot.beNil;
        expect(shot.tags).to.beKindOf([NSArray class]);
    });
    
    it(@"should be a gif image when animated is true", ^{
        expect(shot.animated).beTruthy;
        expect([NSURL URLWithString:shot.images.hidpi].pathExtension).equal(@"gif");
    });
});

SpecEnd