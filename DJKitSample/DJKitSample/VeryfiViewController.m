//
//  VeryfiViewController.m
//  DJKitSample
//
//  Created by DJ on 2017/5/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "VeryfiViewController.h"
#import <DJVeryifiTimeManager.h>

@interface VeryfiViewController ()
@property (nonatomic, strong) UIButton *clockBtn1;
@property (nonatomic, strong) UIButton *clockBtn2;
@end

@implementation VeryfiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithFrame:CGRectMake(100, 80, 80, 24) title:@"获取" color:[UIColor redColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    self.clockBtn1 = btn;
    
    DJWeakSelf
    [[DJVeryifiTimeManager manager] checkTimeWithType:1 process:^(DJVerificationCodeType type, NSUInteger ticket, BOOL stop) {
        if (ticket>0)
        {
            weakSelf.clockBtn1.userInteractionEnabled = NO;
            weakSelf.clockBtn1.selected = YES;
            weakSelf.clockBtn1.titleLabel.font = [UIFont systemFontOfSize:10.0f];
            weakSelf.clockBtn1.titleLabel.text = [NSString stringWithFormat:@"%@ 秒后重新获取", @(ticket)];
            [weakSelf.clockBtn1 setTitle:[NSString stringWithFormat:@"%@ 秒后重新获取", @(ticket)] forState:UIControlStateSelected];
        }
        else
        {
            weakSelf.clockBtn1.userInteractionEnabled = YES;
            weakSelf.clockBtn1.selected = NO;
            weakSelf.clockBtn1.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [weakSelf.clockBtn1 setTitle:@"获取" forState:UIControlStateNormal];
        }
    }];
    
    [btn addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithFrame:CGRectMake(100, 120, 80, 24) title:@"获取" color:[UIColor redColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    self.clockBtn2 = btn;
    
    [btn addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)click1
{
    DJWeakSelf
    [[DJVeryifiTimeManager manager] startTimeWithType:1 process:^(DJVerificationCodeType type, NSUInteger ticket, BOOL stop) {
        if (ticket>0)
        {
            weakSelf.clockBtn1.userInteractionEnabled = NO;
            weakSelf.clockBtn1.selected = YES;
            weakSelf.clockBtn1.titleLabel.font = [UIFont systemFontOfSize:10.0f];
            weakSelf.clockBtn1.titleLabel.text = [NSString stringWithFormat:@"%@ 秒后重新获取", @(ticket)];
            [weakSelf.clockBtn1 setTitle:[NSString stringWithFormat:@"%@ 秒后重新获取", @(ticket)] forState:UIControlStateSelected];
        }
        
        if (stop)
        {
            weakSelf.clockBtn1.userInteractionEnabled = YES;
            weakSelf.clockBtn1.selected = NO;
            weakSelf.clockBtn1.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [weakSelf.clockBtn1 setTitle:@"重新获取" forState:UIControlStateNormal];
        }
    }];

}

- (void)click2
{
    DJWeakSelf
    [[DJVeryifiTimeManager manager] startTimeWithType:1 process:^(DJVerificationCodeType type, NSUInteger ticket, BOOL stop) {
        if (ticket>0)
        {
            weakSelf.clockBtn2.userInteractionEnabled = NO;
            weakSelf.clockBtn2.selected = YES;
            weakSelf.clockBtn2.titleLabel.font = [UIFont systemFontOfSize:10.0f];
            weakSelf.clockBtn2.titleLabel.text = [NSString stringWithFormat:@"%@ 秒后重新获取", @(ticket)];
            [weakSelf.clockBtn2 setTitle:[NSString stringWithFormat:@"%@ 秒后重新获取", @(ticket)] forState:UIControlStateSelected];
        }
        
        if (stop)
        {
            weakSelf.clockBtn2.userInteractionEnabled = YES;
            weakSelf.clockBtn2.selected = NO;
            weakSelf.clockBtn2.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [weakSelf.clockBtn2 setTitle:@"重新获取" forState:UIControlStateNormal];
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
