//
//  KZBlockProbe.h
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import "KZProbe.h"

typedef BOOL (^KZBlockProbeBlock)();

@interface KZBlockProbe : NSObject <KZProbe>
@property (nonatomic, copy, readonly) KZBlockProbeBlock block;
@property (nonatomic, readonly, getter = isSatisfied) BOOL satisfied;

+ (instancetype)probeWithBlock:(KZBlockProbeBlock)block;
- (instancetype)initWithBlock:(KZBlockProbeBlock)aBlock;
@end

#define assertEventuallyWithBlockAndTimeout(block,timeout) \
assertEventuallyWithTimeout([KZBlockProbe probeWithBlock:block], timeout)

#define assertEventuallyWithBlock(block) \
assertEventually([KZBlockProbe probeWithBlock:block])