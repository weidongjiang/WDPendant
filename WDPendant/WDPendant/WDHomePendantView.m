//
//  WDHomePendantView.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//



#import "WDHomePendantView.h"
#import "Masonry.h"

@interface WDHomePendantView ()

@end

@implementation WDHomePendantView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {

    // 布局
    self.backgroundColor = [UIColor redColor];

    // 约束
    [self setAllLayoutView];
}

- (void)setAllLayoutView {



    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)addPendantSubview:(UIView *)view {
    [view addSubview:self];
}

- (void)updatePendantLayout:(CGPoint)point {
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.superview).offset(point.x);
        make.top.equalTo(self.superview).offset(point.y);
        make.width.mas_offset(100);
        make.height.mas_offset(50);
    }];

    [self.superview setNeedsUpdateConstraints];
    [self.superview updateConstraintsIfNeeded];
    [self.superview layoutIfNeeded];
}


- (WDBaseViewBenchmarkType)pendantBenchmarkType {
    return WDBaseViewBenchmarkTypeLeftTop;
}
- (CGFloat)pendantID {
    return 10001;
}
- (CGFloat)pendantLevelWeight {
    return 1;
}

- (CGFloat)pendantVerticalWeight {
    return 1;
}

- (CGFloat)pendantLevelMargin {
    return 10;
}
- (CGFloat)pendantVerticalMargin {
    return 10;
}
- (CGFloat)pendantWidth {
    return 100;
}
- (CGFloat)pendantHeight {
    return 50;
}



@end
