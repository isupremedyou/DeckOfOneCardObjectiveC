//
//  TCCardController.m
//  DeckOfOneCardObjectiveC
//
//  Created by Travis Chapman on 10/31/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import "TCCardController.h"

@implementation TCCardController

+ (TCCardController *) shared {
    static TCCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [TCCardController new];
    });
    return shared;
}

- (void)fetchCardWith:(NSNumber *)numberOfCards completion:(void (^)(TCCard * _Nullable card))completion
{
    NSURL *baseURL = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new"];
    NSURL *drawCardURL = [baseURL URLByAppendingPathComponent:@"draw" isDirectory:YES];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:drawCardURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *countQuery = [NSURLQueryItem queryItemWithName:@"count" value:[numberOfCards stringValue]];
    components.queryItems = @[countQuery];
    
    NSURL *url = components.URL;
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error with the dataTask: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"There was no data");
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *cardsArray = topLevelDictionary[@"cards"];
        
        for (NSDictionary *cardDict in cardsArray) {
            TCCard *card = [[TCCard alloc] initWithDictionary:cardDict];
            self.card = [TCCard alloc];
            self.card = card;
        }
        completion(self.card);
    }];
    [dataTask resume];
}

- (void)fetchCardImageWith:(TCCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imageURLAsString];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error with the dataTask: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"There was no data");
            completion(nil);
            return;
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }];
    [dataTask resume];
}

@end
