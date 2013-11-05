//
//  KZHamcrestProbe.h
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import <Foundation/Foundation.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCHamcrest/HCStringDescription.h>
#import "KZProbe.h"

@interface KZHamcrestProbe : NSObject <KZProbe>
@property (nonatomic, strong, readonly) id<HCMatcher> matcher;
@property (nonatomic, readonly, getter = isSatisfied) BOOL satisfied;

+ (instancetype) probeWithObjectPointer:(__strong id *)objectPtr matcher:(id<HCMatcher>)matcher;
- (instancetype) initWithObjectPointer:(__strong id *)objectPtr matcher:(id<HCMatcher>)aMatcher;
- (instancetype) actualObject;
@end

#define assertEventuallyThatWithTimeout(objectPtr, aMatcher, timeout) \
assertEventuallyWithTimeout([KZHamcrestProbe probeWithObjectPointer:objectPtr matcher:aMatcher], timeout)

#define assertEventuallyThat(objectPtr, aMatcher) \
assertEventually([KZHamcrestProbe probeWithObjectPointer:objectPtr matcher:aMatcher])