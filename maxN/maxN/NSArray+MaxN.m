//
//  NSArray+MaxN.m
//  maxN
//
//  Created by Paul Jacobs on 1/15/15.
//  Copyright (c) 2015 Paul Jacobs. All rights reserved.
//

#import "NSArray+MaxN.h"

@implementation NSArray (MaxN)
-(NSArray*)maxN:(NSInteger)n
{
    NSAssert(self.count >= n, @"Arrays smaller than N not yet supported");

    NSMutableArray *topN = [NSMutableArray array];

    for (int i = 0; i < n; i++) {
        [topN addObject:@-1.0e20];
    }
    
    for (NSNumber *num in self) { // for each number
        for (NSInteger i = 0; i < n; i++) { // then for each topN slot
            if ([num doubleValue] > [(NSNumber*)topN[i] doubleValue]) { //
                for (NSInteger ii = n-1; ii >= i+1; ii--) {
                        topN[ii] = topN[ii-1];
                }
                topN[i] = num;
                break;
            }
        }
    }
    
    return topN;
}

-(NSArray*)max4
{
    return [self maxN:4];
}
@end
