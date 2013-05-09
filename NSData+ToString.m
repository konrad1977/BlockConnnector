//
//  NSData+ToString.m
//  spelnyheterna
//
//  Created by Mikael Konradsson on 2013-01-26.
//
//

#import "NSData+ToString.h"

@implementation NSData (NString)

- (NSString*)string {
    return [[NSString alloc] initWithBytes:[self bytes]
                                    length:[self length]
                                  encoding:NSUTF8StringEncoding];
}

- (void) jsonDictionaryWithBlock:(void (^)(NSDictionary *dict))dictionaryBlock
                      errorBlock:(void (^)(NSError *error))errorBlock {
    
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if (dict == nil && error != nil) {
        errorBlock(error);
    } else {
        dictionaryBlock(dict);
    }
}

@end
