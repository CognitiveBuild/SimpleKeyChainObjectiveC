//
//  SimpleKeyChainLibraryTests.m
//  SimpleKeyChainLibraryTests
//
//  Created by Mihui on 6/16/16.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleKeyChain.h"

@interface SimpleKeyChainLibraryTests : XCTestCase

@end

@implementation SimpleKeyChainLibraryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSaving {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *aValueToBeStored = @"This is a test";
    NSString *aKeyToBeUsed = @"aKey";

    BOOL aValueShouldBeTrue = [SimpleKeyChain setStringByKey:aKeyToBeUsed value:aValueToBeStored];
    XCTAssertTrue(aValueShouldBeTrue);

    NSString *storedValue = [SimpleKeyChain getStringByKey:aKeyToBeUsed];
    XCTAssertEqualObjects(aValueToBeStored, storedValue);
}

- (void)testDeleting {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *aValueToBeStored = @"This is a test";
    NSString *aKeyToBeUsed = @"aKey";

    [SimpleKeyChain setStringByKey:aKeyToBeUsed value:aValueToBeStored];

    NSString *storedValue = [SimpleKeyChain getStringByKey:aKeyToBeUsed];
    XCTAssertEqualObjects(aValueToBeStored, storedValue);

    BOOL aValueShouldBeTrue = [SimpleKeyChain removeStringByKey:aKeyToBeUsed];
    XCTAssertTrue(aValueShouldBeTrue);

    storedValue = [SimpleKeyChain getStringByKey:aKeyToBeUsed];
    XCTAssertNil(storedValue);
}

- (void)testPerformanceSaving {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [SimpleKeyChain setStringByKey:@"aKey" value:@"This is a test"];
    }];
}

- (void)testPerformanceRetrieving {
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [SimpleKeyChain getStringByKey:@"aKey"];
    }];
}

- (void)testPerformanceDeleting {
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [SimpleKeyChain removeStringByKey:@"aKey"];
    }];
}

@end
