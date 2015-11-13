//
//  ViewController.m
//  Matchizmo
//
//  Created by Voitenko Daniil on 28.10.15.
//  Copyright © 2015 Voitenko Daniil. All rights reserved.
//

#import "MatchizmoViewController.h"
#import "PlayingDeck.h"
#import "CardMatchingGame.h"

@interface MatchizmoViewController ()
@property (nonatomic,strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) Card *cardInGame;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numberOfMatches;

@end

@implementation MatchizmoViewController

- (Deck *)createDeck
{
    return [[PlayingDeck alloc] init];
}


- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    _game.numberOfMatches = [self numberOfMatches];
    return _game;
}

- (NSUInteger)numberOfMatches
{
    return self.numberOfMatches.selectedSegmentIndex+2;
}


- (IBAction)ChangeCard:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        self.cardInGame = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:self.cardInGame]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:self.cardInGame]
                              forState:UIControlStateNormal];
        
        cardButton.enabled = !self.cardInGame.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}
- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}

- (IBAction)newGameButton:(UIButton *)sender
{
    self.game = nil;
    [self updateUI];
}
- (IBAction)changeNumberOfmatches:(id)sender {
    self.game = nil;
    [self updateUI];
}


@end
