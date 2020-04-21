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
        self.backgroundColor = [UIColor yellowColor];
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
    return 10003;
}

- (CGFloat)pendantLevelWeight {
    return 4;
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
