//
//  WaterFallCell.m
//  UICollectionView_waterfall
//
//  Created by icy on 2017/5/12.
//  Copyright © 2017年 icy. All rights reserved.
//

#import "WaterFallCell.h"
#import "Masonry.h"
@implementation WaterFallCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
    __weak typeof(self) ws = self;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(0));
        make.height.mas_equalTo(@(30));
        make.bottom.mas_equalTo(ws.desArea.mas_bottom).offset(12.0);
    }];
    [self.desArea mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(64)).offset(7.5);
        make.left.width.mas_equalTo(ws.contentView).offset(5.0);
      make.height.mas_greaterThanOrEqualTo(@(30)).priority(1000);
    }];
    // Initialization code
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    //把width换成height 然后在对应的masonry中设置高度
    newFrame.size.width = size.width +20;
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}

@end
