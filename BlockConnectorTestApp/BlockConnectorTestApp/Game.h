//
//  Game.h
//  BlockConnectorTestApp
//
//  Created by Mikael Konradsson on 2013-05-09.
//  Copyright (c) 2013 Mikael Konradsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic, strong) NSString *name;

+ (Game*)gameFromDictionary:(NSDictionary*)dict;

@end
