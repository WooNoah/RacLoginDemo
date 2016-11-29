//
//  ViewController.m
//  testRACCommand
//
//  Created by tb on 16/11/29.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa.h>
#import "WDLoginViewModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userPhoneTF;
@property (weak, nonatomic) IBOutlet UITextField *UserPwdTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *juhuaView;

@property (nonatomic,strong) WDLoginViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.juhuaView.hidden = YES;
    self.loginBtn.enabled = NO;
    
    self.viewModel = [[WDLoginViewModel alloc]init];
    
    
    @weakify(self);
    //bind data from UI to the ViewModel
    RAC(self.viewModel,userPhone) = self.userPhoneTF.rac_textSignal;
    RAC(self.viewModel,userPwd) = self.UserPwdTF.rac_textSignal;

    self.loginBtn.rac_command = self.viewModel.loginCommand;
    [[self.viewModel.loginCommand executionSignals]
     subscribeNext:^(RACSignal *x) {
         @strongify(self);
         [self lostFirstResponse];
         self.juhuaView.hidden = NO;
         [self.juhuaView startAnimating];
         
         [x subscribeNext:^(id x) {
             self.juhuaView.hidden = YES;
             [self.juhuaView stopAnimating];
             NSLog(@"%@",x);
             [[[UIAlertView alloc]initWithTitle:@"message" message:x delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"okay", nil] show];
         }];
     }];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self lostFirstResponse];
}


- (void)lostFirstResponse {
    [self.UserPwdTF endEditing:YES];
    [self.userPhoneTF endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
