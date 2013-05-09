//
//  URLBlockRequester.h
//  spelnyheterna
//
//  Created by Mikael Konradsson on 2013-02-08.
//
//

#import <Foundation/Foundation.h>

@interface BlockConnector : NSObject

typedef void (^dataLoadedBlock)(NSData* data);
typedef void (^errorBlock)(NSError* error);
typedef void (^requestBlock)(NSMutableURLRequest *request);

- (void) sendAsyncronousRequest:(NSURLRequest*)request
                completionBlock:(dataLoadedBlock)completionBlock
                   failureBlock:(errorBlock)errorBlock;


- (void) sendAsyncronousJSONData:(NSData*)jsondata
                           toUrl:(NSString*)url
                 completionBlock:(dataLoadedBlock)completionBlock
                    failureBlock:(errorBlock)errorBlock;


- (void) post:(requestBlock)requestBlock
   completion:(dataLoadedBlock)dataLoadedBlock
        error:(errorBlock)errorBlock;

@end
