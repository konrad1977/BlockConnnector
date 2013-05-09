//
//  GameRequester.m
//  BlockConnectorTestApp
//
//  Created by Mikael Konradsson on 2013-05-09.
//  Copyright (c) 2013 Mikael Konradsson. All rights reserved.
//

#import "GameRequester.h"
#import "BlockConnector.h"
#import "NSDictionary+JsonData.h"
#import "NSData+ToString.h"
#import "Game.h"

@interface GameRequester() {
    
}

@property (nonatomic, strong) BlockConnector *blockConnector;
@property (nonatomic, copy) errorBlock errorBlock;
@end



@implementation GameRequester

- (id)init {
    
    self = [super init];
    if (self) {
        [self setErrorBlock:^(NSError *error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:error.domain
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
        }];
    }
    return self;
}

- (BlockConnector*)blockConnector {
    if (_blockConnector == nil) {
        _blockConnector = [[BlockConnector alloc] init];
    }
    return _blockConnector;
}

- (NSURL*)requestURL {
    return [NSURL URLWithString:@"http://www.spelnyheterna.se/Webservice/v2/games/GetGameList.ashx"];
}

- (NSDictionary*)requestDictionary {
    return @{ @"ClientID" : @"Test",
              @"ImageHeight" : @480,
              @"ImageWidth" : @640,
              @"ImageScaleFunc" : @0,
              @"NumberOfItems" : @10,
              @"Unit" : @0,
              @"Version" : @1
              };
}

- (void) parseJSONData:(NSData*)data
            completion:(void (^)(NSArray *gameList))gameListLoaded {
    
    [data jsonDictionaryWithBlock:^(NSDictionary *dataDict) {
    
        NSMutableArray *gameList = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in dataDict) {
            [gameList addObject:[Game gameFromDictionary:dict]];
        }
        gameListLoaded(gameList);

    } errorBlock:self.errorBlock];
}

- (void)requestData:(void (^)(NSData *data))dataLoadedBlock {
    
    __block NSData *requestData;
    
    [[self requestDictionary] jsonDataWithBlock:^(NSData *data) {
        requestData = data;
    } errorBlock:self.errorBlock];
    
    [[self blockConnector] post:^(NSMutableURLRequest *request) {
        
        [request setURL:[self requestURL]];
        [request setValue:@"application/json"
       forHTTPHeaderField:@"Content-Type"];
        
        [request setTimeoutInterval:15];
        [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
        [request setHTTPMethod:@"POST"];
        [request setHTTPShouldUsePipelining:YES];
        [request setHTTPBody:requestData];
        
    } completion:dataLoadedBlock
                          error:self.errorBlock];
}

- (void)requestGameListWithCompletionBlock:(void (^)(NSArray *gameList))gameListLoaded
                                errorBlock:(void (^)(NSError* error))errrorBlock {
    
    [self requestData:^(NSData *data) {
        [self parseJSONData:data
                 completion:gameListLoaded];
    }];
}

@end
