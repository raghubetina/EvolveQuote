//
//  Individual.h
//  EvolveQuote
//
//  Created by Raghu Betina on 2/2/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Individual : NSObject <NSCopying>

@property (nonatomic) NSMutableString *genome;

- (void)randomize:(int)length;
- (int)score:(NSString *)target;
- (void)mutate:(float)geneMutationRate;
- (id)copyWithZone: (NSZone *) zone;

@end
