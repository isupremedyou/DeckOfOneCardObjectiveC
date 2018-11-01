//
//  CardViewController.m
//  DeckOfOneCardObjectiveC
//
//  Created by Travis Chapman on 11/1/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import "CardViewController.h"

@interface CardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

- (IBAction)drawButtonTapped:(UIButton *)sender;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)drawButtonTapped:(UIButton *)sender {
    
    [TCCardController.shared fetchCardWith:@1 completion:^(TCCard * _Nullable card) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.suitLabel.text = card.suit;
        });
        
        [TCCardController.shared fetchCardImageWith:card completion:^(UIImage * _Nullable cardImage) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.cardImageView.image = cardImage;
            });
        }];
    }];
    
}
@end
