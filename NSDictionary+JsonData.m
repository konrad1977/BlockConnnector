
//
//  NSDictionary+JsonData.m
//  BlockConnectorTestApp
//
//  Created by Mikael Konradsson on 2013-05-09.
//  Copyright (c) 2013 Mikael Konradsson. All rights reserved.
//

#import "NSDictionary+JsonData.h"

@implementation NSDictionary (JSON)

- (void) jsonDataWithBlock:(void (^)(NSData *data))dataBlock
                errorBlock:(void (^)(NSError *error))errorBlock {
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    if (error != nil) {
        errorBlock(error);
    } else {
        dataBlock(data);
    }
}
@end
