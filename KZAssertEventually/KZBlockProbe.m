//
//  KZBlockProbe.m
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import "KZBlockProbe.h"

@interface KZBlockProbe ()
@property (nonatomic, copy, readwrite) KZBlockProbeBlock block;
@property (nonatomic, readwrite, getter = isSatisfied) BOOL satisfied;
@end

@implementation KZBlockProbe
+ (instancetype) probeWithBlock:(KZBlockProbeBlock)block {
  return [[self alloc] initWithBlock:block];
}

- (instancetype)initWithBlock:(KZBlockProbeBlock)aBlock {
  if ((self = [super init])) {
    self.block = aBlock;
    self.satisfied = NO;
    [self sample];
  }
  
  return self;
}

- (void) sample {
  self.satisfied = self.block();
}

- (NSString *) describeToString:(NSString *)description {
  return [description stringByAppendingString:@"Block call did not return positive value."];
}
@end