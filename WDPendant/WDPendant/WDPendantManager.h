//
//  WDPendantManager.h
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDBaseView.h"
#import "WDPendantLayoutProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface WDPendantManager : NSObject

@property (nonatomic, weak) id<WDPendantLayoutProtocol>           layoutDelegate; ///<  <#value#>


/// 添加一组View
/// @param pendantViewArray pendantViewArray description
- (void)addPendantViewArray:(NSMutableArray<WDBaseView *> *)pendantViewArray;


/// 添加单个View
/// @param pendantView pendantView description
- (void)addPendantView:(WDBaseView *)pendantView;

/// 删除单个View 确保View的唯一性
/// @param pendantView pendantView description
- (void)removePendantView:(WDBaseView *)pendantView;


/// 更新某一个view的大小和属性
/// @param pendantView pendantView description
- (void)updatePendantView:(WDBaseView *)pendantView;


/// 查询是否有这个View 显示在管理器里面，主要依据 pendantViewID 和 WDBaseViewBenchmarkType 进行查询
/// @param pendantView pendantView description
/// yes表示存在
- (BOOL)getPendantView:(WDBaseView *)pendantView;


@end

NS_ASSUME_NONNULL_END
