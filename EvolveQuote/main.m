//
//  main.m
//  EvolveQuote
//
//  Created by Raghu Betina on 2/2/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "World.h"
#import "Individual.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        World *world = [[World alloc] init];
        world.target = @"The ability to quote is a serviceable substitute for wit.";
        world.individualMutationRate = 0.1;
        world.geneMutationRate = 0.05;
        world.populationSize = 100;
        world.deathRate = 0.40;
        [world evolve];
//        NSLog(@"It took %d generations to converge.", world.generations);
//        
//        NSString *target = @"The ability to quote is a serviceable substitute for wit.";
//        float individualMutationRate = 0.1;
//        float geneMutationRate = 0.05;
//        int populationSize = 100;
//        float deathRate = 0.40;
//        
//        int numReplacements = (int)populationSize * deathRate;
//        
//        // NSLog(@"Creating population of random individuals.\n");
//        NSMutableArray *population = [[NSMutableArray alloc] initWithCapacity:populationSize];
//        for (int i = 0; i < populationSize; i++) {
//            Individual *individual = [[Individual alloc] init];
//            [individual randomize:[target length]];
//            [population addObject:individual];
//        }
//        
//        int generation = 1;
//        
//        while (![[[population objectAtIndex:0] genome] isEqualToString:target]) {
//            
//            // NSLog(@"Sorting by fitness.\n");
//            [population sortUsingComparator:^NSComparisonResult(id individual1, id individual2) {
//                Individual *i1 = (Individual*)individual1;
//                Individual *i2 = (Individual*)individual2;
//
//                if ([i1 score:target] > [i2 score:target]) {
//                    return (NSComparisonResult)NSOrderedDescending;
//                }
//                if ([i1 score:target] < [i2 score:target]) {
//                    return (NSComparisonResult)NSOrderedAscending;
//                }
//                return (NSComparisonResult)NSOrderedSame;
//            }];
//
//            // NSLog(@"Culling weakest; replacing with fittest.\n");
//            NSArray *fittest = [[NSArray alloc] initWithArray:[population subarrayWithRange:NSMakeRange(0, numReplacements)]
//                                                    copyItems:YES];
//            [population replaceObjectsInRange:NSMakeRange(populationSize - numReplacements, numReplacements)
//                         withObjectsFromArray:fittest];
//            
//            // NSLog(@"Mutating some individuals at random.\n");
//            for (int i = 0; i < 100; i++) {
//                double randomNumber = ((double)arc4random() / 0x100000000);
//                if (randomNumber < individualMutationRate) {
//                    [population[i] mutate:geneMutationRate];
//                }
//            }
//            
//            NSLog(@"Gen %d: %@ (%d)\n", generation, [(Individual *)[population objectAtIndex:0] genome], [population[0] score:target]);
//             
//            generation++;
//            
//        }
        
    }
    return 0;
}

