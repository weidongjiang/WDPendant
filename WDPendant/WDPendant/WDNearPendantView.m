//
//  WDNearPendantView.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDNearPendantView.h"

@implementation WDNearPendantView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {

    // 布局
    self.backgroundColor = [UIColor greenColor];

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

    self.frame = CGRectMake(point.x, point.y, 80, 80);

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
    return 3;
}

- (CGFloat)pendantLevelMargin {
    return 10;
}
- (CGFloat)pendantVerticalMargin {
    return 10;
}
- (CGFloat)pendantWidth {
    return 80;
}
- (CGFloat)pendantHeight {
    return 80;
}


@end
