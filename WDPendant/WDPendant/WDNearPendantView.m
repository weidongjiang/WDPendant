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

@end
