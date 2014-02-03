//
//  World.m
//  EvolveQuote
//
//  Created by Raghu Betina on 2/3/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import "World.h"
#import "Individual.h"

@implementation World

- (void)evolve
{
    int numReplacements = self.populationSize * self.deathRate;
    
    // NSLog(@"Creating population of random individuals.\n");
    self.population = [[NSMutableArray alloc] initWithCapacity:self.populationSize];
    for (int i = 0; i < self.populationSize; i++) {
        Individual *individual = [[Individual alloc] init];
        [individual randomize:[self.target length]];
        [self.population addObject:individual];
    }
    
    self.generations = 1;
    
    while (![[[self.population objectAtIndex:0] genome] isEqualToString:self.target]) {
        // NSLog(@"Mutating some individuals at random.\n");
        for (int i = 0; i < 100; i++) {
            double randomNumber = ((double)arc4random() / 0x100000000);
            if (randomNumber < self.individualMutationRate) {
                [self.population[i] mutate:self.geneMutationRate];
            }
        }
        
        // NSLog(@"Sorting by fitness.\n");
        [self.population sortUsingComparator:^NSComparisonResult(id individual1, id individual2) {
            Individual *i1 = (Individual*)individual1;
            Individual *i2 = (Individual*)individual2;
            
            if ([i1 score:self.target] > [i2 score:self.target]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            if ([i1 score:self.target] < [i2 score:self.target]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        // NSLog(@"Culling weakest; replacing with fittest.\n");
        NSArray *fittest = [[NSArray alloc] initWithArray:[self.population subarrayWithRange:NSMakeRange(0, numReplacements)]
                                                copyItems:YES];
        [self.population replaceObjectsInRange:NSMakeRange(self.populationSize - numReplacements, numReplacements)
                     withObjectsFromArray:fittest];
        
        NSLog(@"Gen %d: %@ (%d)\n", self.generations, [(Individual *)[self.population objectAtIndex:0] genome], [self.population[0] score:self.target]);
        
        self.generations++;
    }
}

@end
