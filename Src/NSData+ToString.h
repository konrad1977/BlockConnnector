//
//  NSData+ToString.h
//  spelnyheterna
//
//  Created by Mikael Konradsson on 2013-01-26.
//
//

#import <Foundation/Foundation.h>

@interface NSData (NSString)

- (NSString*)string;

- (void) jsonDictionaryWithBlock:(void (^)(NSDictionary *dict))dictionaryBlock
                      errorBlock:(void (^)(NSError *error))errorBlock;

@end
