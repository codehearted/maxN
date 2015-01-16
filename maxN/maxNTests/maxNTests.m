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
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testMax5 {
    NSArray *testArray1 = @[@1.0, @30.3, @20.1, @200, @3.41e23, @5, @1.4, @10e8, @25];
    NSArray *expectedResultsArray1 = @[@3.41e23, @10e8, @200, @30.3, @25];
    NSArray *resultsArray1 = [testArray1 maxN:5];
    
    //    NSLog(@"Top %d of array:%@ = %@",5,testArray1, [testArray1 maxN:5]);

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

@end
