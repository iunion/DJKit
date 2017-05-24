//
//  TableViewController.m
//  DJKitSample
//
//  Created by DJ on 2017/5/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "VeryfiViewController.h"
#import "SingleLineViewController.h"


static NSString *CellIdentifier = @"DJKitCell";

@interface TableViewController ()

@property (nonatomic, strong) NSArray *listArray;
@property (nonatomic, assign) NSUInteger vcType;

@end

@implementation TableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style listArray:(NSArray *)array type:(NSUInteger)type
{
    self = [super initWithStyle:style];
    
    self.listArray = array;
    self.vcType = type;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [[cell textLabel] setText:[self.listArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)deselect:(UITableView *)tableView
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.vcType)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    ViewController *vc = [[ViewController alloc] initWithCanPopGesutreRecognized:NO];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                    
                case 1:
                {
                    VeryfiViewController *vc = [[VeryfiViewController alloc] initWithCanPopGesutreRecognized:NO];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                    
                case 2:
                {
                    SingleLineViewController *vc = [[SingleLineViewController alloc] initWithCanPopGesutreRecognized:YES];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        case 1:
        {
            ViewController *vc = [[ViewController alloc] initWithCanPopGesutreRecognized:NO];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2:
        {
            ViewController *vc = [[ViewController alloc] initWithCanPopGesutreRecognized:NO];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
