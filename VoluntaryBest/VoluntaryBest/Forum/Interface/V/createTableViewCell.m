//
//  createTableViewCell.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/3/29.
//

#import "createTableViewCell.h"
#import "Masonry.h"

@implementation createTableViewCell

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
    
    self.cellImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.cellImage];
    
    self.mainLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.mainLabel];
    
    self.secondLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.secondLabel];
    
    return self;
}

- (void) layoutSubviews {
    [self.cellImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(self).with.offset(5);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cellImage.mas_right).with.offset(10);
        make.top.equalTo(self).with.offset(5);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self).with.offset(5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    
    
}



@end
