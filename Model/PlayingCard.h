//
//  PlayingCard.h
//  Matchizmo
//
//  Created by Voitenko Daniil on 28.10.15.
//  Copyright © 2015 Voitenko Daniil. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)MaxRank;

@end
