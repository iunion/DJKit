//
//  ViewController.m
//  DJKitSample
//
//  Created by DJ on 2017/5/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ViewController.h"
#import <UIViewController+NavigationController.h>

@interface ViewController ()
@property (nonatomic, assign) BOOL canPopGesutre;
@end

@implementation ViewController

- (instancetype)initWithCanPopGesutreRecognized:(BOOL)pop
{
    self = [super init];
    self.canPopGesutre = pop;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavBar:@"DJNavigationController" bgColor:nil leftTitle:nil leftBtnImage:@"navigationbar_back_icon" leftToucheEvent:@selector(backAction:) rightTitle:@"New" rightBtnImage:nil rightToucheEvent:@selector(newAction:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canPopGesutreRecognized
{
    return self.canPopGesutre;
}

- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)newAction:(id)sender
{
    ViewController *vc = [[ViewController alloc] initWithCanPopGesutreRecognized:YES];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
