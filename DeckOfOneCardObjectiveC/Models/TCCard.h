//
//  TCCard.h
//  DeckOfOneCardObjectiveC
//
//  Created by Travis Chapman on 10/31/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCCard : NSObject

@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *suit;
@property (nonatomic, copy) NSString *imageURLAsString;


@end

@interface TCCard (JSONConvertible)

- (instancetype) initWithDictionary:(NSDictionary *)jsonDictionary;

@end

NS_ASSUME_NONNULL_END
