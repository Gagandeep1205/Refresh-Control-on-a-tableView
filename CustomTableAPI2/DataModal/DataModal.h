//
//  DataModal.h
//  CustomTableAPI
//
//  Created by Gagandeep Kaur on 08/07/15.
//  Copyright (c) 2015 Gagandeep Kaur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModal : NSObject

-(void) CallApi : (NSString *)urlStr : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure ;

@end