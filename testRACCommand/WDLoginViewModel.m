//
//  WDLoginViewModel.m
//  testRACCommand
//
//  Created by tb on 16/11/29.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "WDLoginViewModel.h"
#import "WDTestNetwork.h"

@implementation WDLoginViewModel

- (instancetype)init {
    if (self == [super init]) {
        [self confiViewModel];
    }
    return self;
}


- (void)confiViewModel {
    
    RACSignal *accountValidSignal = [RACObserve(self, userPhone)
                             map:^id(NSString *value) {
                                 return @(value.length >= 4);
                             }];

    RACSignal *passwordValidSignal = [RACObserve(self, userPwd)
                             map:^id(NSString *value) {
                                 return @(value.length >= 6);
                             }];

    RACSignal *buttonSignal = [RACSignal combineLatest:@[accountValidSignal,passwordValidSignal]
                                                reduce:^id(NSNumber *zh, NSNumber *mm){
                                                    NSLog(@"account:%d\tpassword:%d",[zh integerValue],[mm integerValue]);
                                                    return @([zh boolValue] && [mm boolValue]);
                                                }];
    
    
    self.loginCommand = [[RACCommand alloc]initWithEnabled:buttonSignal signalBlock:^RACSignal *(id input) {
        return [WDTestNetwork loginWithPhoneNumber:self.userPhone password:self.userPwd];
    }];
}

@end
