//
//  CustomedTableViewCell.m
//  CustomedTableDemo
//
//  Created by renren on 15/9/4.
//
//

#import "CustomedTableViewCell.h"

@implementation CustomedTableViewCell

- (UIView *)profileCardContentView
{
    if (!_profileCardContentView) {
        _profileCardContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        [_profileCardContentView setBackgroundColor:RGBCOLOR(0xf4, 0xf4, 0xf4)];
        [_profileCardContentView addSubview:self.profileCardHeadImg];
        [_profileCardContentView addSubview:self.profileCardName];
        [_profileCardContentView addSubview:self.profileCardGender];
        [_profileCardContentView addSubview:self.profileCardDescription];
    }
    return _profileCardContentView;
}

- (UIImageView *)profileCardHeadImg
{
    if (!_profileCardHeadImg) {
        _profileCardHeadImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        [_profileCardHeadImg setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _profileCardHeadImg;
}

- (UILabel *)profileCardName
{
    if (!_profileCardName) {
        _profileCardName = [[UILabel alloc] init];
        [_profileCardName setFont:[UIFont systemFontOfSize:15]];
        [_profileCardName setTextColor:RGBCOLOR(0x28, 0x28, 0x28)];
    }
    return _profileCardName;
}

- (UIImageView *)profileCardGender
{
    if (!_profileCardGender) {
        _profileCardGender = [[UIImageView alloc] init];
    }
    return _profileCardGender;
}

- (UILabel *)profileCardDescription
{
    if (!_profileCardDescription) {
        _profileCardDescription = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 95, 13)];
        [_profileCardDescription setFont:[UIFont systemFontOfSize:12]];
        [_profileCardDescription setTextColor:RGBCOLOR(0x64, 0x64, 0x64)];
        [_profileCardDescription setNumberOfLines:0];
        [_profileCardDescription setLineBreakMode:NSLineBreakByTruncatingTail];
    }
    return _profileCardDescription;
}

- (UIButton *)profileCardBottomBar
{
    if (!_profileCardBottomBar) {
        _profileCardBottomBar = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        [_profileCardBottomBar setBackgroundColor:RGBCOLOR(0xff, 0xff, 0xff)];
        [_profileCardBottomBar.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_profileCardBottomBar setTitle:@"分享名片" forState:UIControlStateNormal];
        [_profileCardBottomBar setTitleColor:RGBCOLOR(0x64, 0x64, 0x64) forState:UIControlStateNormal];
        [_profileCardBottomBar setImage:[UIImage imageNamed:@"Feed_Share"] forState:UIControlStateNormal];
        [_profileCardBottomBar setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    }
    return _profileCardBottomBar;
}

- (void)setObjectWithDictionary:(NSDictionary *)dic
{
    [self.contentView addSubview:self.profileCardContentView];
    [self.profileCardHeadImg setImage:[UIImage imageNamed:[dic objectForKey:@"userHeadImg"]]];
    [self.profileCardName setText:[dic objectForKey:@"userName"]];
    [_profileCardName sizeToFit];
    CGFloat left = self.profileCardHeadImg.frame.origin.x + self.profileCardHeadImg.frame.size.width;
    CGFloat top = self.profileCardHeadImg.frame.origin.y;
    [self.profileCardName setFrame:CGRectMake(left + 10, top + 24, self.profileCardName.frame.size.width, self.profileCardName.frame.size.height)];
    top += 24;
    [self.profileCardGender setImage:[UIImage imageNamed:[dic objectForKey:@"userGender"]]];
    [_profileCardGender sizeToFit];
    [self.profileCardGender setFrame:CGRectMake(left + 10 + self.profileCardName.frame.size.width + 5, top, self.profileCardGender.frame.size.width, self.profileCardGender.frame.size.height)];
    _profileCardGender.center = CGPointMake(_profileCardGender.center.x,_profileCardName.center.y);
    
    NSString *userDescription = [dic objectForKey:@"userDescription"];
    [self.profileCardDescription setText:userDescription];
//    [_profileCardDescription sizeToFit];
    CGSize constrainedTitleSize = [userDescription sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(SCREEN_WIDTH - 95, 30) lineBreakMode:NSLineBreakByTruncatingTail];
    CGSize titleActualSize = [userDescription sizeWithFont:[UIFont systemFontOfSize:12]];
    top += self.profileCardName.frame.size.height + 10;
    [self.profileCardDescription setFrame:CGRectMake(left + 10, top, self.profileCardDescription.frame.size.width, constrainedTitleSize.height)];
    [self.contentView addSubview:self.profileCardBottomBar];
}

- (void)layoutSubviews
{
    self.profileCardContentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
    self.profileCardBottomBar.frame = CGRectMake(0, 100, SCREEN_WIDTH, 44);
}

@end
