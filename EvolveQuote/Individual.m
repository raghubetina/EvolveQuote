//
//  Individual.m
//  EvolveQuote
//
//  Created by Raghu Betina on 2/2/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import "Individual.h"

@interface Individual ()

@property (nonatomic, readwrite) NSMutableString *genome;

@end

@implementation Individual

- (instancetype)init
{
    return [self initWithLength:57];
}

- (instancetype)initWithLength:(int)length
{
    NSArray *alphabet = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @",", @".", @"!", @"?", @"'", @" ", nil];
    
    NSMutableString *randomGenome = [[NSMutableString alloc] initWithCapacity:length];
    
    for (int i = 0; i < 57; i++) {
        NSString *randomLetter = [alphabet objectAtIndex:arc4random_uniform((int)[alphabet count])];
        [randomGenome insertString:randomLetter
                           atIndex:i];
    }
    
    self.genome = randomGenome;
    
    return self;
}

- (int)scoreAgainstTarget:(NSString *)target
{
    int score = 0;
    
    for (int i = 0; i < [target length]; i++) {
        int targetChar = [target characterAtIndex:i];
        int selfChar = [self.genome characterAtIndex:i];
        int distance = abs(targetChar - selfChar);
        score += distance;
    }
    
    return score;
}

- (void)mutateGenomeAtRate:(float)geneMutationRate
{
    NSArray *alphabet = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @",", @".", @"!", @"?", @"'", @" ", nil];
    
    for (int i = 0; i < [self.genome length]; i++) {
        double randomNumber = ((double)arc4random() / 0x100000000);
        if (randomNumber < geneMutationRate) {
            NSString *randomLetter = [alphabet objectAtIndex:arc4random_uniform((int)[alphabet count])];
            [self.genome replaceCharactersInRange:NSMakeRange(i, 1)
                                       withString:randomLetter];
        }
    }
}

- (id)copyWithZone:(NSZone *)zone
{
    Individual *individualCopy = [[Individual allocWithZone: zone] init];
    [individualCopy setGenome:[self.genome mutableCopy]];
    return individualCopy;
}

@end
