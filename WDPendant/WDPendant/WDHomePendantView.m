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

        self.pendantBenchmarkType = WDBaseViewBenchmarkTypeLeftTop;
        self.pendantID = 10001;
        self.pendantLevelWeight = 1;
        self.pendantVerticalWeight = 1;
        self.pendantLevelMargin = 10;
        self.pendantVerticalMargin = 10;
        self.pendantWidth = 100;
        self.pendantHeight = 50;
        // 布局
        self.backgroundColor = [UIColor redColor];

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
