//
//  KZProbePoller.h
//  
//
//  Created by James Richard on 10/22/13.
//
//

#import "KZProbe.h"
#import "KZTimeout.h"

@interface KZProbePoller : NSObject
@property (nonatomic, readonly) NSTimeInterval timeoutInterval;
@property (nonatomic, readonly) NSTimeInterval delayInterval;

- (instancetype) initWithTimeout:(NSTimeInterval)theTimeout delay:(NSTimeInterval)theDelay;
- (BOOL) check:(id<KZProbe>)probe;
@end