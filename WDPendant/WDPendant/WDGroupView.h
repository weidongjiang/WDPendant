//
//  WDGroupView.h
//  WDPendant
//
//  Created by yixiajwd on 2020/4/17.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WDGroupView : UIView


- (void)addPendantView:(WDBaseView *)pendantView;

- (void)addLeftTopPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray;

- (void)addRightBottomPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray;

- (void)addRightTopPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray;

@end

NS_ASSUME_NONNULL_END
