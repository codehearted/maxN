//
//  maxNTests.m
//  maxNTests
//
//  Created by Paul Jacobs on 1/15/15.
//  Copyright (c) 2015 Paul Jacobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSArray+MaxN.h"

@interface maxNTests : XCTestCase

@end

@implementation maxNTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testMax5 {
    NSArray *testArray1 = @[@1.0, @30.3, @20.1, @200, @3.41e23, @5, @1.4, @10e8, @25];
    NSArray *expectedResultsArray1 = @[@3.41e23, @10e8, @200, @30.3, @25];
    NSArray *resultsArray1 = [testArray1 maxN:5];
    
    XCTAssert([resultsArray1 isEqualToArray:expectedResultsArray1], @"Max5: Got (%@), wanted (%@)", resultsArray1, expectedResultsArray1);
}



- (void)testMax4 {
    NSArray *testArray1 = @[@20, @31, @900.8, @900.08, @850, @892, @875, @15, @0.1, @892.00081, @0];
    NSArray *expectedResultsArray1 = @[@900.8, @900.08, @892.00081, @892];
    NSArray *resultsArray1 = [testArray1 max4];
    NSArray *testArray2 = @[@0.1, @0.2, @11, @-108000];
    NSArray *expectedResultsArray2 = @[@11, @0.2, @0.1, @-108000];
    NSArray *resultsArray2 = [testArray2 max4];
    
    XCTAssert([resultsArray1 isEqualToArray:expectedResultsArray1],  @"Max4 Test 1: Got (%@), wanted (%@)", resultsArray1, expectedResultsArray1);
    XCTAssert([resultsArray2 isEqualToArray:expectedResultsArray2],  @"Max4 Test 2: Got (%@), wanted (%@)", resultsArray2, expectedResultsArray2);
}

- (void)testMax4shortened {
    NSArray *testArray1 = @[@0.1, @0.2, @11];
    NSArray *expectedResultsArray1 = @[@11, @0.2, @0.1];
    NSArray *resultsArray1 = [testArray1 max4];
    
    XCTAssert([resultsArray1 isEqualToArray:expectedResultsArray1],  @"Max4shortened: Got (%@), wanted (%@)", resultsArray1, expectedResultsArray1);
}

- (void)testMax6WithDups {
    NSArray *testArray1 = @[@1.0, @-5, @-5, @-40, @5.5, @-6.5, @-128, @-258];
    NSArray *expectedResultsArray1 = @[@5.5, @1.0, @-5, @-5, @-6.5];
    NSArray *resultsArray1 = [testArray1 maxN:6];
    
    XCTAssert([resultsArray1 isEqualToArray:expectedResultsArray1], @"Max6WithDups: Got (%@), wanted (%@)", resultsArray1, expectedResultsArray1);
}


- (void)testMax3LargeArray {
    NSMutableArray *testArray1 = [NSMutableArray array];
    for (int i = 0; i < 25000; i++) {
        [testArray1 addObject:[NSNumber numberWithDouble:(arc4random()%10000000)*.00001]];
    }
    [testArray1 addObjectsFromArray:@[@252, @500, @19214.34, @23]];
    NSArray *expectedResultsArray1 = @[@19214.34, @500, @252];
    NSArray *resultsArray1 = [testArray1 maxN:3];
    
    XCTAssert([resultsArray1 isEqualToArray:expectedResultsArray1], @"Max3LargeArray: Got (%@), wanted (%@)", resultsArray1, expectedResultsArray1);
}



@end
