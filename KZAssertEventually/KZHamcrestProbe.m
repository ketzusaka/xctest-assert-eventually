//
//  KZHamcrestProbe.m
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import "KZHamcrestProbe.h"

@interface KZHamcrestProbe () {
  __strong id* pointerToActualObject;
}

@property (nonatomic, strong, readwrite) id<HCMatcher> matcher;
@property (nonatomic, readwrite, getter = isSatisfied) BOOL satisfied;
@end

@implementation KZHamcrestProbe

+ (instancetype) probeWithObjectPointer:(__strong id*)objectPtr matcher:(id<HCMatcher>)matcher {
  return [[self alloc] initWithObjectPointer:objectPtr matcher:matcher];
}

- (instancetype) initWithObjectPointer:(__strong id*)objectPtr matcher:(id<HCMatcher>)aMatcher {
  if ((self = [super init])) {
    pointerToActualObject = objectPtr;
    self.matcher = aMatcher;
    self.satisfied = NO;
    [self sample];
  }
  return self;
}

- (void)sample {
  self.satisfied = [self.matcher matches:self.actualObject];
}

- (NSString *) describeToString:(NSString *)description {
  HCStringDescription* stringDescription = [HCStringDescription stringDescription];
  [[[[stringDescription appendText:@"Expected "] appendDescriptionOf:self.matcher] appendText:@", got "] appendText:[NSString stringWithFormat:@"%@", self.actualObject]];
  
  return [description stringByAppendingString:[stringDescription description]];
}

- (id) actualObject {
  return *pointerToActualObject;
}
@end