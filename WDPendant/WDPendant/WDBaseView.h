//
//  WDBaseView.h
//  WDPendant
//
//  Created by yixiajwd on 2020/4/17.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDPendantLayoutProtocol.h"

NS_ASSUME_NONNULL_BEGIN

//typedef NS_ENUM(NSInteger,WDBaseViewBenchmarkType) {
//    WDBaseViewBenchmarkTypeLeftTop = 1, // 左上
//    WDBaseViewBenchmarkTypeRightTop = 2, // 右上
//    WDBaseViewBenchmarkTypeRightBottom = 3, // 右下
//};

@interface WDBaseView : UIView

@property (nonatomic, assign) WDBaseViewBenchmarkType         pendantBenchmarkType; ///< 从哪一个基准点开始
@property (nonatomic, assign) CGFloat         pendantID; ///< 挂件View 唯一标识ID
@property (nonatomic, assign) CGFloat         pendantLevelWeight; ///< 水平权重  同一行 水平的排序 位置
@property (nonatomic, assign) CGFloat         pendantVerticalWeight; ///< 竖直权重 在第几行的排序
@property (nonatomic, assign) CGFloat         pendantLevelMargin; ///< 与上一个View的水平方向的间距
@property (nonatomic, assign) CGFloat         pendantVerticalMargin; ///< 与上一个View的竖直方向的间距Margin
@property (nonatomic, assign) CGFloat         pendantWidth; ///< view宽度
@property (nonatomic, assign) CGFloat         pendantHeight; ///< view高度
@property (nonatomic, assign) BOOL         isRetract; ///< <#value#>

@property (nonatomic, copy) NSString           *testlabelText; ///<  <#value#>
@property (nonatomic, strong) UIView        *pendantSuperView; ///< <#value#>

//- (WDBaseViewBenchmarkType)pendantBenchmarkType;///< 从哪一个基准点开始
//- (CGFloat)pendantID;///< 挂件View 唯一标识ID
//- (CGFloat)pendantLevelWeight;///< 水平权重  (数据一样标识同一行) 水平的排序位置
//- (CGFloat)pendantVerticalWeight;///< 竖直权重 在第几行的排序
//- (CGFloat)pendantLevelMargin;///< 与上一个View的水平方向的间距
//- (CGFloat)pendantVerticalMargin;///< 与上一个View的竖直方向的间距Margin
//- (CGFloat)pendantWidth;///< view宽度
//- (CGFloat)pendantHeight;///< view高度

- (void)addPendantSubview:(UIView *)view;
- (void)willUpdatePendantLayout:(WDBaseView *)pendantView;
- (void)didUpdatePendantLayout:(WDBaseView *)pendantView;

@end

NS_ASSUME_NONNULL_END
