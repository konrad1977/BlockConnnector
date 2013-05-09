//
//  Game.m
//  BlockConnectorTestApp
//
//  Created by Mikael Konradsson on 2013-05-09.
//  Copyright (c) 2013 Mikael Konradsson. All rights reserved.
//

#import "Game.h"

@implementation Game

+ (Game*)gameFromDictionary:(NSDictionary*)dict {
    Game *newGame = [[Game alloc] init];
    [newGame setName:dict[@"Name"]];
    return newGame;
}

@end
