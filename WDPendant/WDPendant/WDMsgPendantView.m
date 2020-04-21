//
//  WDMsgPendantView.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDMsgPendantView.h"

@implementation WDMsgPendantView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {

    // 布局
    self.backgroundColor = [UIColor yellowColor];
    

    // 约束
    [self setAllLayoutView];
}

- (void)setAllLayoutView {



    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)updatePendantLayout:(CGPoint)point {
    self.frame = CGRectMake(point.x, point.y, 100, 50);

}

- (void)addPendantSubview:(UIView *)view {
    [view addSubview:self];
}

- (WDBaseViewBenchmarkType)pendantBenchmarkType {
    return WDBaseViewBenchmarkTypeLeftTop;
}
- (CGFloat)pendantID {
    return 10001;
}

- (CGFloat)pendantLevelWeight {
    return 2;
}

- (CGFloat)pendantVerticalWeight {
    return 2;
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
