//
//  SingleLineViewController.m
//  DJKitSample
//
//  Created by DJ on 2017/5/24.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "SingleLineViewController.h"
#import <DJSingleLineView.h>

@interface SingleLineViewController ()

@property (nonatomic, strong) DJSingleLineView *m_TopLineView;
@property (nonatomic, strong) DJSingleLineView *m_UnderLineView;
@property (nonatomic, strong) DJSingleLineView *m_DashLineView;

@end

@implementation SingleLineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 100, UI_SCREEN_WIDTH-30, 50)];
    view.backgroundColor = [UIColor colorWithHex:0xEEEEEE];
    [self.view addSubview:view];
    
    CGRect topLineFrame = CGRectMake(0, 0, view.width, 1);
    self.m_TopLineView = [[DJSingleLineView alloc] initWithFrame:topLineFrame];
    self.m_TopLineView.lineColor = [UIColor redColor];
    self.m_TopLineView.needGap = NO;
    [view addSubview:self.m_TopLineView];
    
    CGRect underLineFrame = CGRectMake(0, view.height-1, view.width, 1);
    self.m_UnderLineView = [[DJSingleLineView alloc] initWithFrame:underLineFrame];
    self.m_UnderLineView.lineColor = [UIColor yellowColor];
    [view addSubview:self.m_UnderLineView];
    
    CGRect dashLineFrame = CGRectMake(0, 20, view.width, 1);
    self.m_DashLineView = [[DJSingleLineView alloc] initWithFrame:dashLineFrame];
    self.m_DashLineView.isDash = YES;
    self.m_DashLineView.lineSpacing = 3.0f;
    self.m_DashLineView.lineColor = [UIColor brownColor];
    self.m_DashLineView.needGap = NO;
    [view addSubview:self.m_DashLineView];
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
