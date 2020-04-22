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
        self.pendantBenchmarkType = WDBaseViewBenchmarkTypeLeftTop;
        self.pendantID = 10002;
        self.pendantLevelWeight = 1;
        self.pendantVerticalWeight = 2;
        self.pendantLevelMargin = 10;
        self.pendantVerticalMargin = 10;
        self.pendantWidth = 100;
        self.pendantHeight = 50;
        // 布局
        self.backgroundColor = [UIColor grayColor];

    }
    return self;
}


- (void)willUpdatePendantLayout:(WDBaseView *)pendantView {
    NSLog(@"pendantView--will--%@",pendantView);

}

- (void)didUpdatePendantLayout:(WDBaseView *)pendantView {
    NSLog(@"pendantView--did--%@",pendantView);
}


- (void)setTestlabelText:(NSString *)testlabelText {
    [super setTestlabelText:testlabelText];
}
@end
