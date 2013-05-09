//
//  NSDictionary+JsonData.h
//  BlockConnectorTestApp
//
//  Created by Mikael Konradsson on 2013-05-09.
//  Copyright (c) 2013 Mikael Konradsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

- (void) jsonDataWithBlock:(void (^)(NSData *data))dataBlock
                errorBlock:(void (^)(NSError *error))errorBlock;

@end
