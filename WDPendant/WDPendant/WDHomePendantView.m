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
