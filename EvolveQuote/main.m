//
//  main.m
//  EvolveQuote
//
//  Created by Raghu Betina on 2/2/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "World.h"


int main(int argc, const char * argv[])
{
    @autoreleasepool {
//        World *world = [[World alloc] init];
        NSString *target = @"The ability to quote is a serviceable substitute for wit.";
        World *world = [[World alloc] initWithTarget:target
                              individualMutationRate:0.1
                                    geneMutationRate:0.05
                                      populationSize:100
                                           deathRate:0.25];
        [world evolve];
        NSLog(@"It took %d generations to converge.", world.generations);
    }
    return 0;
}

