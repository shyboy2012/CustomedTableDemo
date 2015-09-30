//
//  ViewController.m
//  CustomedTableDemo
//
//  Created by renren on 15/9/4.
//
//

#import "ViewController.h"
#import "CustomedTableViewCell.h"
#import "SVPullToRefresh.h"
#define INITIALSIZE     7

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *cellArray;
@property (nonatomic, strong) NSDictionary   *cellInfo;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        CGSize fullSize = [UIScreen mainScreen].bounds.size;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, fullSize.width, fullSize.height)];
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        _tableView.backgroundColor = [UIColor colorWithRed:250 / 255.0 green:250 / 255.0 blue:250 / 255.0 alpha:1];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        __weak typeof(self) bself = self;
        [_tableView addPullToRefreshWithActionHandler:^{
            [bself insertRowToTable];
        }];
        [_tableView addInfiniteScrollingWithActionHandler:^{
            [bself insertRowToTable];
        }];
    }
    return _tableView;
}

- (id)init
{
    if (self = [super init]) {
        self.cellArray = [NSMutableArray array];
        for (int i = 0; i < INITIALSIZE; i++) {
            NSDictionary *cellInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"default_head", @"userHeadImg", [NSString stringWithFormat:@"用户%d", i], @"userName", @"list_ic_male_round", @"userGender", @"职场新人 从事互联网工作 喜欢打球跑步看书上网聊天\n我的座右铭是没有梦想何必远方 流光容易把人抛红了樱桃绿了芭蕉", @"userDescription", nil];
            [self.cellArray addObject:cellInfo];
        }
    }
    return self;
}

- (void)insertRowToTable
{
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    __weak typeof(self) bself = self;
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (_cellArray) {
            NSInteger num = _cellArray.count;
            NSDictionary *cellInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"default_head", @"userHeadImg", [NSString stringWithFormat:@"用户%ld", (long)num], @"userName", @"list_ic_male_round", @"userGender", @"职场新人 从事互联网工作 喜欢打球跑步看书上网聊天\n我的座右铭是没有梦想何必远方 流光容易把人抛红了樱桃绿了芭蕉", @"userDescription", nil];
            [_cellArray addObject:cellInfo];
        }
        [bself.tableView reloadData];
        [bself.tableView.pullToRefreshView stopAnimating];
        [bself.tableView.infiniteScrollingView stopAnimating];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义cell";
//    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.tableView];
//    self.view = self.tableView;
//    [self.tableView setFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView triggerPullToRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource Methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomedTableViewCell"];
    if (cell == nil) {
        cell = [[CustomedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomedTableViewCell"];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//去除cell分割线
    NSDictionary *cellInfo = [_cellArray objectAtIndex:indexPath.row];
    [cell setObjectWithDictionary:cellInfo];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 144;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
