//
//  CustomedTableViewCell.h
//  CustomedTableDemo
//
//  Created by renren on 15/9/4.
//
//

#import <UIKit/UIKit.h>

@interface CustomedTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView          *profileCardContentView;
@property (nonatomic, strong) UIImageView     *profileCardHeadImg;
@property (nonatomic, strong) UILabel         *profileCardName;
@property (nonatomic, strong) UIImageView     *profileCardGender;
@property (nonatomic, strong) UILabel         *profileCardDescription;
@property (nonatomic, strong) UIButton        *profileCardBottomBar;

- (void)setObjectWithDictionary:(NSDictionary *)dic;

@end
