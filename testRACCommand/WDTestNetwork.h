//
//  WDTestNetwork.h
//  testRACCommand
//
//  Created by tb on 16/11/29.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface WDTestNetwork : NSObject

+ (RACSignal *)loginWithPhoneNumber:(NSString *)ph password:(NSString *)pwd;

@end
