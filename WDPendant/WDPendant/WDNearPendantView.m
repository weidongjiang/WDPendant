//
//  WDNearPendantView.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDNearPendantView.h"
#import "Masonry.h"

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
