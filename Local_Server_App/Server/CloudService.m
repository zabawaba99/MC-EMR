/*
 *  Copyright ©  Mobile Clinic-Electronic Medical Records.
 *  Permission is granted to copy, distribute and/or modify this document
 *  under the terms of the GNU Free Documentation License, Version 1.3
 *  or any later version published by the Free Software Foundation;
 *  with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
 *  A copy of the license is included in the section entitled "GNU
 *  Free Documentation License".
 */
//
//  CloudService.m
//  Mobile Clinic
//
//  Created  on 3/15/13. 
//

#import "CloudService.h"

@interface CloudService()
{
    NSString *kURL;
    BOOL isAuthenticated;
    NSString *kApiKey;
}
@end

@implementation CloudService

#pragma mark - Cloud API
#pragma mark-

+(CloudService *) cloud{
    static CloudService *mApi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mApi = [[self alloc]init];
    });
    
    return mApi;
}

-(id)init{
    self = [super init];
    if(self)
    {
//        kURL = @"http://staging-webapp.herokuapp.com/";
        kApiKey = @"12345";
        self.kAccessToken = @"";
        isAuthenticated = NO;
        //production
//        kURL = @"http://znja-webapp.herokuapp.com/api/";
        
        [self getAccessToken:^(BOOL success) {
            if(success)
                NSLog(@"Connected To Cloud");
        }];

        kURL = @"http://0.0.0.0:3000/";
    }
    return self;
}

-(void)getAccessToken:(void(^)(BOOL success)) completion{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params setObject:kApiKey forKey:@"api_key"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURL *url = [NSURL  URLWithString:[NSString stringWithFormat:@"%@%@", kURL, @"auth/access_token"]];
        
        NSData *data;
        
        if (params) {
            NSData *json = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
            
            data = [[NSString stringWithFormat:@"%@%@",
                     @"&params=",[[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding] ]
                    dataUsingEncoding: NSUTF8StringEncoding];
        }
        else
        {
            data = [[NSString stringWithFormat:@"%@",@""] dataUsingEncoding: NSUTF8StringEncoding];
        }
        
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
        
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody: data];
        
        
        [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
            
            if(!error){
                NSError *jsonError;
                
                //read and print the server response for debug
                NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
               // NSLog(@"%@", myString);
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                
                if ((completion && json) || (completion && jsonError)) {
                    self.kAccessToken = [[json objectForKey:@"data"] objectForKey:@"access_token"];
                    completion(YES);
                }
            }
            else
            {
                completion(NO);
            }
            
        }];
        
    });
}

-(void)query:(NSString *)stringQuery parameters: (NSDictionary *)params completion:(void(^)(NSError *error, NSDictionary *result)) completion
{
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc]initWithDictionary:params];
    [mDic setObject:self.kAccessToken forKey:@"access_token"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self queryWithPartialURL:[NSString stringWithFormat:@"api/%@", stringQuery] parameters:mDic completion:completion];
        
    });
}

-(void)query:(NSString *)stringQuery parameters: (NSDictionary *)params imageData:(NSData *)imageData completion:(void(^)(NSError *error, NSDictionary *result)) completion
{
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc]initWithDictionary:params];
    [mDic setObject:self.kAccessToken forKey:@"access_token"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),  ^{
        
        [self queryWithPartialURL:[NSString stringWithFormat:@"api/%@", mDic] parameters:params imageData:imageData completion:completion];
        
    });
    
}

-(void)queryWithPartialURL:(NSString *)partialURL parameters: (NSDictionary *)params imageData:(NSData *)imageData completion:(void(^)(NSError *error, NSDictionary *result)) completion{
    //url that you're going to send the image to
    NSString* url = [NSString stringWithFormat:@"%@%@%@", kURL, @"api/", partialURL];
    
    //pretty self explanatory request building
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [request setTimeoutInterval:10000];
    
    NSString *POSTBoundary = @"0xKhTmLbOuNdArY";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", POSTBoundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    [request setHTTPMethod: @"POST"];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];

    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    for (NSString *param in params) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", POSTBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    //add image
    if (imageData) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", POSTBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", @"file"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }

    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", POSTBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:body];

    [self sendAsyncRequest:request completion:completion];
}

-(void)queryWithPartialURL:(NSString *)partialURL parameters: (NSDictionary *)param completion:(void(^)(NSError *error, NSDictionary *result)) completion
{
    NSURL *url = [NSURL  URLWithString:[NSString stringWithFormat:@"%@%@", kURL, partialURL]];
    
    NSData *data;
    
    if (param) {
        NSData *json = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:nil];
        
        data = [[NSString stringWithFormat:@"%@%@",
                 @"&params=",[[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding] ]
                dataUsingEncoding: NSUTF8StringEncoding];
    }
    else
    {
        data = [[NSString stringWithFormat:@"%@",@""] dataUsingEncoding: NSUTF8StringEncoding];
    }
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: data];
    
    
    [self sendAsyncRequest:request completion:completion];
}

-(void)sendAsyncRequest:(NSURLRequest *)request completion:(void(^)(NSError *error, NSDictionary *result)) completion
{
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        
        if(!error){
            NSError *jsonError;
            //read and print the server response for debug
            NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", myString);
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
            
            if ((completion && json) || (completion && jsonError)) {
                completion(jsonError, json);
            }
        }
        else
        {
            completion(error, nil);
        }
        
    }];
    
    //    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
    
}

#pragma mark- Cloud API Utilities
#pragma mark-
-(NSString *)convertDictionaryToString:(NSDictionary *) jsonParams
{
    NSData *jsonParamsData = [NSJSONSerialization dataWithJSONObject:jsonParams options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonParamsData encoding:NSUTF8StringEncoding];
}

@end
