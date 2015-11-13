//
//  CardMatchingGame.h
//  Matchizmo
//
//  Created by Voitenko Daniil on 30.10.15.
//  Copyright © 2015 Voitenko Daniil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSUInteger numberOfMatches;

//designated initializer
- (instancetype)initWithCardCount: (NSUInteger)count
                        usingDeck:(Deck *)deck;


- (void)chooseCardAtIndex: (NSUInteger)index;
- (Card *)cardAtIndex: (NSUInteger)index;

@end
