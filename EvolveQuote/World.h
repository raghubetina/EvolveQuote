//
//  World.h
//  EvolveQuote
//
//  Created by Raghu Betina on 2/3/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface World : NSObject

@property (nonatomic) NSString *target;
@property (nonatomic) float individualMutationRate;
@property (nonatomic) float geneMutationRate;
@property (nonatomic) int populationSize;
@property (nonatomic) float deathRate;
@property (nonatomic) NSMutableArray *population;
@property (nonatomic) int generations;

- (instancetype)initWithTarget:(NSString *)target
        individualMutationRate:(float)individualMutationRate
              geneMutationRate:(float)geneMutationRate
                populationSize:(int)populationSize
                     deathRate:(float)deathRate;



- (void) evolve;

@end
