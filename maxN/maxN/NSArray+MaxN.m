//
//  NSArray+MaxN.m
//  maxN
//
//  Created by Paul Jacobs on 1/15/15.
//  Copyright (c) 2015 Paul Jacobs. All rights reserved.
//

#import "NSArray+MaxN.h"

@implementation NSArray (MaxN)

// Note: Because there is only one loop in the method below that scales according the the size of the array,
// it is O(n). To be clear, in O notation the n in O(n) represents the size of the array (self.count),
// in the method the parameter n is the number of items to return and is not dependent on the size of the array.

// Note: I'm commenting somewhat more than I typically would, since I'm explaining an algorithm.

-(NSArray*)maxN:(NSInteger)n
{

    if (self.count < n) { n = self.count; }

    NSAssert(self.count >= n, @"Arrays smaller than N should have changed N by now");

    NSMutableArray *topN = [NSMutableArray array];

    // Initialize the topN array with very small numbers
    for (int i = 0; i < n; i++) {
        //        [topN addObject:@-1.0e20];
        [topN addObject:@-DBL_MAX];
    }
    
    for (NSNumber *num in self) { // for each number
        NSAssert([num isKindOfClass:[NSNumber class]], @"Tried to get maxN of array containing a %@, can only get maxN of NSNumbers",[[num class] description]);
        for (NSInteger i = 0; i < n; i++) { // then for each topN slot
            // if this number is bigger than the number occupying that slot,
            if ([num doubleValue] > [(NSNumber*)topN[i] doubleValue]) {
                // then, looping backwards to avoid copying the same value down the whole list,
                for (NSInteger ii = n-1; ii >= i+1; ii--) {
                    // nudge down the previous slot occupant (and the rest of the list) down a slot
                        topN[ii] = topN[ii-1];
                }
                // then set the slot to the new number
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
