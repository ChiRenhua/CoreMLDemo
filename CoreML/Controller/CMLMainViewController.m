//
//  CMLMainViewController.m
//  CoreML
//
//  Created by Renhuachi on 2017/8/30.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CMLMainViewController.h"
#import "CMLFlowerViewController.h"
#import "CMLSentimentAnalysisViewController.h"

@interface CMLMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *cellArr;

@end

@implementation CMLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Demo";
    
    self.cellArr = [[NSArray alloc] initWithObjects:@"识花", @"情绪分析", @"敬请期待", @"敬请期待", @"敬请期待", @"敬请期待", @"敬请期待", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 50;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = self.cellArr[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            CMLFlowerViewController *flowerVC = [CMLFlowerViewController new];
            [self.navigationController pushViewController:flowerVC animated:YES];
        }
            
            break;
        case 1: {
            
        }
            
            break;
        case 2: {
            
        }
            
            break;
        case 3: {
            
        }
            
            break;
        case 4: {
            
        }
            
            break;
        case 5: {
            
        }
            
            break;
        case 6: {
            
        }
            
            break;
        case 7: {
            
        }
            break;
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
