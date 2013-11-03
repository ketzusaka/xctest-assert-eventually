//
//  KZTimeout.m
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import "KZTimeout.h"

@interface KZTimeout ()
@property (nonatomic, strong, readwrite) NSDate *timeoutDate;
@end

@implementation KZTimeout
- (instancetype) initWithTimeout:(NSTimeInterval)timeout {
  if ((self = [super init])) {
    self.timeoutDate = [[NSDate alloc] initWithTimeIntervalSinceNow:timeout];
  }
  
  return self;
}

- (BOOL) hasTimedOut {
  return [self.timeoutDate timeIntervalSinceNow] < 0;
}
@end