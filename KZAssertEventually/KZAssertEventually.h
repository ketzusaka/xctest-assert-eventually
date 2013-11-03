//
//  KZAssertEventually.h
//  
//
//  Created by James Richard on 10/22/13.
//
//  Based on a gist by Luke Redpath <luke@lukeredpath.co.uk>
//

#define HC_SHORTHAND
#define DEFAULT_PROBE_TIMEOUT 2
#define DEFAULT_PROBE_DELAY   0.1

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "KZProbe.h"

@class XCTestCase;

void KZ_assertEventuallyWithLocationAndTimeout(XCTestCase *testCase, const char* fileName, int lineNumber, id<KZProbe> probe, NSTimeInterval timeout);
void KZ_assertEventuallyWithLocation(XCTestCase *testCase, const char* fileName, int lineNumber, id<KZProbe> probe);

#define assertEventuallyWithTimeout(probe, timeout) \
KZ_assertEventuallyWithLocationAndTimeout(self, __FILE__, __LINE__, probe, timeout)

#define assertEventually(probe) \
KZ_assertEventuallyWithLocation(self, __FILE__, __LINE__, probe)

#import "KZTimeout.h"
#import "KZProbePoller.h"
#import "KZBlockProbe.h"
#import "KZHamcrestProbe.h"