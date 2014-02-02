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
        
        Individual *individual = [[Individual alloc] init];
        [individual randomize];
        NSLog(@"%d", [individual score:@"The ability to quote is a serviceable substitute for wit."]);
        
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

