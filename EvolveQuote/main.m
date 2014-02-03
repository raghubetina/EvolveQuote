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

        World *world = [[World alloc] init];
        world.target = @"The ability to quote is a serviceable substitute for wit.";
        world.individualMutationRate = 0.1;
        world.geneMutationRate = 0.05;
        world.populationSize = 100;
        world.deathRate = 0.40;
        [world evolve];
        NSLog(@"It took %d generations to converge.", world.generations);
        
    }
    return 0;
}

