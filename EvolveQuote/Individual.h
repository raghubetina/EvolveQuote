//
//  Individual.h
//  EvolveQuote
//
//  Created by Raghu Betina on 2/2/14.
//  Copyright (c) 2014 rugb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Individual : NSObject <NSCopying>

@property (nonatomic, readonly) NSMutableString *genome;

- (instancetype)initWithLength:(int)length;
- (int)scoreAgainstTarget:(NSString *)target;
- (void)mutateGenomeAtRate:(float)geneMutationRate;
- (id)copyWithZone: (NSZone *) zone;

@end
