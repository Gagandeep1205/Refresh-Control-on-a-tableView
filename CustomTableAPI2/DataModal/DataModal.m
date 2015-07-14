//
//  DataModal.m
//  CustomTableAPI
//
//  Created by Gagandeep Kaur on 08/07/15.
//  Copyright (c) 2015 Gagandeep Kaur. All rights reserved.
//

#import "DataModal.h"
#import "iOSRequest.h"

@implementation DataModal

-(void) CallApi : (NSString *)urlStr : (void (^)(NSDictionary *))success :(void (^)(NSError *))failure{
    
    [iOSRequest getJSONResponse:[NSString stringWithFormat:@"http://52.24.182.54/apiV2/feeds_mixed.php?lat=%@",urlStr] : ^(NSDictionary *response_success){
        success(response_success);
    } :^(NSError* response_error){
        failure(response_error);
    }];
    
}

@end
