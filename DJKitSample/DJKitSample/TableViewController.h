//
//  TableViewController.h
//  DJKitSample
//
//  Created by DJ on 2017/5/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style listArray:(NSArray *)array type:(NSUInteger)type;

@end
