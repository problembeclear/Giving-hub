//
//  ForumTableViewCell.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/8.
//

#import "ForumTableViewCell.h"
#import "Masonry.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation ForumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.headImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.headImage];
    
    self.labelName = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelName];
    
    self.labelTime = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelTime];
    
    self.buttonMore = [[UIButton alloc] init];
    [self.contentView addSubview:self.buttonMore];

    self.content = [[UILabel alloc] init];
    [self.contentView addSubview:self.content];

    self.viewForImage = [[UIView alloc] init];
    [self.contentView addSubview:self.viewForImage];
    
    self.labelLocation = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelLocation];
        
    self.buttonLike = [[UIButton alloc] init];
    [self.contentView addSubview:self.buttonLike];
    
    self.buttonComment = [[UIButton alloc] init];
    [self.contentView addSubview:self.buttonComment];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.top.equalTo(self.contentView).with.offset(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).with.offset(20);
        make.top.equalTo(self.headImage.mas_top).with.offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    [self.labelTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelName.mas_left).with.offset(0);
        make.top.equalTo(self.labelName.mas_bottom).with.offset(0);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(20);
    }];
    
    [self.buttonMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-20);
        make.top.equalTo(self.contentView).with.offset(10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(15);
        make.top.equalTo(self.labelTime.mas_bottom).with.offset(20);
        make.width.mas_equalTo(Width - 30);
        make.bottom.equalTo(self.viewForImage.mas_top).with.offset(0);
    }];
    
    [self.viewForImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.content).with.offset(0);
        make.top.equalTo(self.content.mas_bottom).with.offset(0);
        make.width.mas_equalTo(Width - 30);
        make.bottom.equalTo(self.buttonLike.mas_top).with.offset(-10);
    }];
    
    
    [self.labelLocation mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.headImage).with.offset(0);
        make.width.mas_equalTo(290);
        make.top.equalTo(self.buttonLike.mas_top).with.offset(10);
        make.bottom.equalTo(self.contentView).with.offset(-10);
    }];
    
    [self.buttonLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.buttonComment.mas_left).with.offset(-10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(self.contentView).with.offset(-10);
    }];
    
    
    [self.buttonComment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(self.contentView).with.offset(-10);
    }];
    return self;
}

- (void) layoutSubviews {
    self.headImage.image = [UIImage imageNamed:@"touxiang0.jpg"];
    
    self.labelName.text = @"abcd";
    
    
    self.labelTime.text = @"1分钟前";
    [self.buttonMore setBackgroundImage:[UIImage imageNamed:@"gengduo-2.png"] forState:UIControlStateNormal];
    
    self.content.text = @"我今天吃了一只烤鸭一块巧克力一个煎饼果子一个炸鸡腿一串烤面筋一个水果蛋糕一份烤冷面一份小龙虾喝了一杯杨枝甘露一瓶可乐一桶珍珠奶茶";
    
    self.viewForImage.backgroundColor = [UIColor greenColor];
    
    self.labelLocation.text = @"中国陕西西安";
    
    [self.buttonLike setImage:[UIImage imageNamed:@"icon-2.png"] forState:UIControlStateNormal];
    [self.buttonLike setImage:[UIImage imageNamed:@"icon.png"] forState:UIControlStateSelected];
    
    [self.buttonComment setBackgroundImage:[UIImage imageNamed:@"pinglun-2.png"] forState:UIControlStateNormal];

}

@end
