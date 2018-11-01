//
//  TCCard.m
//  DeckOfOneCardObjectiveC
//
//  Created by Travis Chapman on 10/31/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import "TCCard.h"

@implementation TCCard

- (instancetype)initWithDictionary:(NSDictionary *)jsonDictionary
{
    NSString *value = jsonDictionary[@"value"];
    NSString *suit = jsonDictionary[@"suit"];
    NSString *imageURLAsString = jsonDictionary[@"image"];
    
    if (self = [super init]) {
        _value = value;
        _suit = suit;
        _imageURLAsString = imageURLAsString;
    }
    return self;
}

@end
