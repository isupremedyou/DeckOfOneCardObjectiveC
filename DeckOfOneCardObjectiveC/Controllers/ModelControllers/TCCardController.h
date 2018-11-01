//
//  TCCardController.h
//  DeckOfOneCardObjectiveC
//
//  Created by Travis Chapman on 10/31/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface TCCardController : NSObject

@property (nonatomic) TCCard *card;

+ (TCCardController *) shared;

- (void) fetchCardWith:(NSNumber *)numberOfCards
            completion:(void (^)(TCCard * _Nullable card))completion;

- (void) fetchCardImageWith:(TCCard *)card
                 completion:(void (^)(UIImage * _Nullable cardImage))completion;

@end

NS_ASSUME_NONNULL_END
