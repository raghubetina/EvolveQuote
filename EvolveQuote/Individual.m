//
//  Individual.m
//  EvolveQuote
//
//  Created by Raghu Betina on 2/2/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import "Individual.h"

@implementation Individual

- (void)randomize:(int)length
{
    NSArray *alphabet = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @",", @".", @"!", @"?", @"'", @" ", nil];
    
    NSMutableString *randomGenome = [[NSMutableString alloc] initWithCapacity:length];
    
    for (int i = 0; i < 57; i++) {
        NSString *randomLetter = [alphabet objectAtIndex:arc4random_uniform([alphabet count])];
        [randomGenome insertString:randomLetter
                           atIndex:i];
    }
    
    self.genome = randomGenome;
}

- (int)score:(NSString *)target
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

//(NSString *)mutate
//{
//
//    return [self.genome];
//}

@end
