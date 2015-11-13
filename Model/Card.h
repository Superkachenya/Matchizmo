//
//  Card.h
//  Matchizmo
//
//  Created by Voitenko Daniil on 28.10.15.
//  Copyright © 2015 Voitenko Daniil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
