//
//  KZProbePoller.m
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import "KZProbePoller.h"

@interface KZProbePoller ()
@property (nonatomic, readwrite) NSTimeInterval timeoutInterval;
@property (nonatomic, readwrite) NSTimeInterval delayInterval;
@end

@implementation KZProbePoller
- (instancetype) initWithTimeout:(NSTimeInterval)theTimeout delay:(NSTimeInterval)theDelay {
  if ((self = [super init])) {
    self.timeoutInterval = theTimeout;
    self.delayInterval = theDelay;
  }
  
  return self;
}

- (BOOL) check:(id<KZProbe>)probe {
  KZTimeout *timeout = [[KZTimeout alloc] initWithTimeout:self.timeoutInterval];
  
  while (![probe isSatisfied]) {
    if ([timeout hasTimedOut]) {
      return NO;
    }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:self.delayInterval]];
    [probe sample];
  }
  
  return YES;
}
@end