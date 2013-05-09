//
//  GameRequester.h
//  BlockConnectorTestApp
//
//  Created by Mikael Konradsson on 2013-05-09.
//  Copyright (c) 2013 Mikael Konradsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameRequester : NSObject

- (void)requestGameListWithCompletionBlock:(void (^)(NSArray *gameList))gameListLoaded
                                errorBlock:(void (^)(NSError* error))errrorBlock;

@end
