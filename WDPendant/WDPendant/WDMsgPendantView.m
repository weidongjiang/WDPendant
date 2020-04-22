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
        self.pendantBenchmarkType = WDBaseViewBenchmarkTypeLeftTop;
        self.pendantID = 10003;
        self.pendantLevelWeight = 2;
        self.pendantVerticalWeight = 3;
        self.pendantLevelMargin = 10;
        self.pendantVerticalMargin = 10;
        self.pendantWidth = 100;
        self.pendantHeight = 50;
        self.backgroundColor = [UIColor yellowColor];
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
