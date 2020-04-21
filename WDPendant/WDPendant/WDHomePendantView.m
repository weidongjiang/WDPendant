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
        self.homeWidth = 100;
        self.homeHeight = 50;
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
    
    self.frame = CGRectMake(point.x, point.y, self.homeWidth, self.homeHeight);

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
    return self.homeWidth;
}
- (CGFloat)pendantHeight {
    return self.homeHeight;
}



@end
