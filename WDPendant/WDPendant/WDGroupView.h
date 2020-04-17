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


- (void)addsonView:(WDBaseView *)sonView;

- (void)addALLSonView:(NSMutableArray<WDBaseView *> *)set;

- (void)addRightBottomSonView:(NSMutableArray<WDBaseView *> *)sonViewArray;

- (void)addRightTopSonView:(NSMutableArray<WDBaseView *> *)sonViewArray;

@end

NS_ASSUME_NONNULL_END
