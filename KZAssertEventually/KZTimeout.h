//
//  KZTimeout.h
//  
//
//  Created by James Richard on 10/22/13.
//
//

@interface KZTimeout : NSObject
@property (nonatomic, strong, readonly) NSDate *timeoutDate;

- (instancetype) initWithTimeout:(NSTimeInterval)timeout;
- (BOOL) hasTimedOut;
@end