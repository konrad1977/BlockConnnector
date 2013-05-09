Copyright (c) 2013
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

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