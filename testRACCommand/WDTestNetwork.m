//
//  WDTestNetwork.m
//  testRACCommand
//
//  Created by tb on 16/11/29.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "WDTestNetwork.h"

@implementation WDTestNetwork

+ (RACSignal *)loginWithPhoneNumber:(NSString *)ph password:(NSString *)pwd {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:[NSString stringWithFormat:@"Hello,%@,\nLogin Completely",ph]];
            [subscriber sendCompleted];
        });
        return nil;
    }];
}

@end
