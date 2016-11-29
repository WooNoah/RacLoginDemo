//
//  WDLoginViewModel.h
//  testRACCommand
//
//  Created by tb on 16/11/29.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface WDLoginViewModel : NSObject

@property (nonatomic,copy) NSString *userPhone;

@property (nonatomic,copy) NSString *userPwd;

@property (nonatomic,strong) RACCommand *loginCommand;

@end
