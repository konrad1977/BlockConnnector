//
//  URLBlockRequester.m
//  spelnyheterna
//
//  Created by Mikael Konradsson on 2013-02-08.
//
//

#import "BlockConnector.h"
#import "NSData+ToString.h"

@implementation BlockConnector

- (void) sendAsyncronousRequest:(NSURLRequest*)request
                completionBlock:(void (^)(NSData *data))completionBlock
                   failureBlock:(void (^)(NSError *error))errorBlock {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error)
                errorBlock(error);
            else
                completionBlock(data);
        });
    });
}

- (void) sendAsyncronousJSONData:(NSData*)jsondata
                           toUrl:(NSString*)url
                 completionBlock:(void (^)(NSData *data))completionBlock
                    failureBlock:(void (^)(NSError *error))errorBlock {
    
    [self post:^(NSMutableURLRequest *request) {
        [request setURL:[NSURL URLWithString:url]];
        [request setValue:@"application/json"
       forHTTPHeaderField:@"Content-Type"];
        
        [request setTimeoutInterval:15];
        [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
        [request setHTTPMethod:@"POST"];
        [request setHTTPShouldUsePipelining:YES];
        [request setHTTPBody:jsondata];
        
    } completion:completionBlock
         error:errorBlock];
}

- (void) post:(requestBlock)requestBlock
   completion:(dataLoadedBlock)dataLoadedBlock
        error:(errorBlock)errorBlock {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    requestBlock(request);
    
    [self sendAsyncronousRequest:request
                 completionBlock:dataLoadedBlock
                    failureBlock:errorBlock];
}

@end
