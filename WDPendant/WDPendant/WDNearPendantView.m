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
        self.pendantBenchmarkType = WDBaseViewBenchmarkTypeLeftTop;
        self.pendantID = 10004;
        self.pendantLevelWeight = 2;
        self.pendantVerticalWeight = 2;
        self.pendantLevelMargin = 10;
        self.pendantVerticalMargin = 10;
        self.pendantWidth = 100;
        self.pendantHeight = 50;
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}


- (void)addPendantSubview:(UIView *)view {
    [view addSubview:self];
}

- (void)updatePendantLayout:(CGPoint)point {

    self.frame = CGRectMake(point.x, point.y, self.pendantWidth, self.pendantHeight);

}

- (void)setTestlabelText:(NSString *)testlabelText {
    [super setTestlabelText:testlabelText];
}

@end
