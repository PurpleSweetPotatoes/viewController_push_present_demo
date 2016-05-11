//
//  ViewController.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "ViewController.h"
#import "BQNavFirstVc.h"
#import "BQNavInteractionFirstVc.h"
#import "BQPresentFirstVc.h"
#import "BQPresentInteractionFirstVc.h"
#import "BQCtrlFirstVc.h"
#import "BQBaseVc.h"

static NSString * const kidentifier = @"UITableViewCell";
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *dataSource;
@property (nonatomic, strong) NSArray *headTitleArray;

@end

@implementation ViewController

#pragma mark - 类方法

#pragma mark - 创建方法

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark - 实例方法
- (void)initData{
    self.dataSource = @{@"模态推送": @{
                                    @"非交互":@"BQPresentFirstVc",
                                    @"交互(手势滑动)":@"BQPresentInteractionFirstVc",
                                    @"转场控制器":@"BQCtrlFirstVc"
                                    },
                        @"导航栏推送":@{
                                    @"非交互":@"BQNavFirstVc",
                                    @"交互(手势滑动)":@"BQNavInteractionFirstVc"
                                    },
                        @"标签控制器推送":@{
                                @"非交互":@"BQBaseVc"
                                }
                        };
    self.headTitleArray = [self.dataSource allKeys];
}

- (void)initUI{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    [self.view addSubview:self.tableView];

}

#pragma mark - 事件响应方法

#pragma mark - UITableViewDataSource Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.headTitleArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [self.dataSource[self.headTitleArray[section]] allKeys];
    return array.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.headTitleArray[section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kidentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kidentifier];
    }
    NSArray *array = [self.dataSource[self.headTitleArray[indexPath.section]] allKeys];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDeleagta Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dict = self.dataSource[self.headTitleArray[indexPath.section]];
    NSArray *array = [dict allKeys];
    NSString *className = dict[array[indexPath.row]];
    
    Class class = NSClassFromString(className);
    
    UIViewController *firstVc = [[class alloc] init];
    firstVc.title = className;
    [self.navigationController pushViewController:firstVc animated:YES];
}

#pragma mark - set方法

#pragma mark - get方法
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -15, self.view.bounds.size.width, self.view.bounds.size.height + 15) style:UITableViewStyleGrouped];
        _tableView.tableHeaderView = nil;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
@end
