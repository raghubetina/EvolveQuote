//
//  main.m
//  EvolveQuote
//
//  Created by Raghu Betina on 2/2/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Individual.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *target = @"The ability to quote is a serviceable substitute for wit.";
        
        Individual *individual = [[Individual alloc] init];
        [individual randomize:[target length]];
        NSLog(@"%d", [individual score:target]);
        
        // create an array of random strings
        // create a scoring function
        // score each string
        // sort array by score
        // "kill" bottom 10, replace with top 10
        // mutate
        // repeat
        
    }
    return 0;
}

