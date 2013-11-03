//
//  KZProbe.h
//  
//
//  Created by James Richard on 10/22/13.
//
//

@protocol KZProbe <NSObject>
- (BOOL) isSatisfied;
- (void) sample;
- (NSString *) describeToString:(NSString *)description;
@end