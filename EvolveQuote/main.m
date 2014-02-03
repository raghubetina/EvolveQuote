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
        float individualMutationRate = 0.5;
        float geneMutationRate = 0.10;
        int populationSize = 100;
        float deathRate = 0.10;
        
        // Create population of randomized individuals
        NSMutableArray *population = [[NSMutableArray alloc] initWithCapacity:populationSize];
        for (int i = 0; i < populationSize; i++) {
            Individual *individual = [[Individual alloc] init];
            [individual randomize:[target length]];
            [population addObject:individual];
        }
        while (1) {

        // Sort by fitness
        
        [population sortUsingComparator:^NSComparisonResult(id individual1, id individual2) {
            Individual *i1 = (Individual*)individual1;
            Individual *i2 = (Individual*)individual2;

            if ([i1 score:target] > [i2 score:target]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            if ([i1 score:target] < [i2 score:target]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];

        // Cull the weakest; replace with fittest
            int numReplacements = (int)populationSize * deathRate;
            for (int i = 0; i < numReplacements; i++) {
                Individual *fittest = [[Individual alloc] init];
                fittest.genome = [[population objectAtIndex:i] genome];
                [population replaceObjectAtIndex:i + (populationSize - numReplacements)
                                      withObject:fittest];
            }
            
        // Mutate some individuals at random
        for (int i = 0; i < 100; i++) {
            double randomNumber = ((double)arc4random() / 0x100000000);
            if (randomNumber < individualMutationRate) {
                [population[i] mutate:geneMutationRate];
            }
        }
        
        NSLog(@"%@", [(Individual *)[population objectAtIndex:0] genome]);
        
        // create an array of random strings
        // create a scoring function
        // score each string
        // sort array by score
        // "kill" bottom 10, replace with top 10
        // mutate
        // repeat
            
        }
        
    }
    return 0;
}

