BlockConnnector
===============

Connect and request your data using Blocks/Lambdas. I tried to make the code stick togheter using Contination Passing Style (CPS).

Example

		[[self blockConnector] post:^(NSMutableURLRequest *request) {
        	[request setURL:[self requestURL]];
			[request setValue:@"application/json"
			forHTTPHeaderField:@"Content-Type"];
        
			[request setTimeoutInterval:15];
			[request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
			[request setHTTPMethod:@"POST"];
			[request setHTTPShouldUsePipelining:YES];
			[request setHTTPBody:requestData];
		}
		completion:^(NSData *dataLoad){
        	//My Data is ready
        }
		error:^(NSError *error) {
			//Something went wrong
        }];

When you use CPS you wont need to write the call back methods for a Delegate, also your code looks like its syncronous but its asynchrounous.