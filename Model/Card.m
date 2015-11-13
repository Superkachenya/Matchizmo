//
//  Card.m
//  Matchizmo
//
//  Created by Voitenko Daniil on 28.10.15.
//  Copyright © 2015 Voitenko Daniil. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
        score = 1;
        }
    }
    
    return score;
}

@end
