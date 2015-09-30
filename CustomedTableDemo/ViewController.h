//
//  ViewController.h
//  CustomedTableDemo
//
//  Created by renren on 15/9/4.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

