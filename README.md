BlockConnnector
===============

Connect and request your data using Blocks/Lambdas. I heavenly use Continuation Passing Style (CPS).


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

CPS makes you code look synchronous even if its asynchronous.
CPS replaces delegate/call backs (and its much cleaner)

License. MIT / BSD 