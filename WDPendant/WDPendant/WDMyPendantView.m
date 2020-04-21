//
//  WDMyPendantView.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDMyPendantView.h"

@implementation WDMyPendantView
- (instancetype)init {
    self = [super init];
    if (self) {
        // 布局
        self.backgroundColor = [UIColor grayColor];

    }
    return self;
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
    return 10002;
}

- (CGFloat)pendantLevelWeight {
    return 3;
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
- (void)setTestlabelText:(NSString *)testlabelText {
    [super setTestlabelText:testlabelText];
}
@end
