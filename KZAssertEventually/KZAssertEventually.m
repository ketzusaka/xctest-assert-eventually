//
//  KZAssertEventually.m
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import "KZAssertEventually.h"

void KZ_assertEventuallyWithLocationAndTimeout(XCTestCase *testCase, const char* fileName, int lineNumber, id<KZProbe> probe, NSTimeInterval timeout) {
  KZProbePoller *poller = [[KZProbePoller alloc] initWithTimeout:timeout delay:DEFAULT_PROBE_DELAY];
  if (![poller check:probe]) {
    NSString *failureMessage = [probe describeToString:[NSString stringWithFormat:@"Probe failed after %d second(s). ", (int)timeout]];
    
    [testCase recordFailureWithDescription:failureMessage inFile:[NSString stringWithUTF8String:fileName] atLine:lineNumber expected:YES];
  }
}

void KZ_assertEventuallyWithLocation(XCTestCase *testCase, const char* fileName, int lineNumber, id<KZProbe> probe) {
  KZ_assertEventuallyWithLocationAndTimeout(testCase, fileName, lineNumber, probe, DEFAULT_PROBE_TIMEOUT);
}