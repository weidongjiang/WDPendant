//
//  WDBaseView.h
//  WDPendant
//
//  Created by yixiajwd on 2020/4/17.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,WDBaseViewBenchmarkType) {
    WDBaseViewBenchmarkTypeLeftTop = 1, // 左上
    WDBaseViewBenchmarkTypeRightTop = 2, // 右上
    WDBaseViewBenchmarkTypeRightBottom = 3, // 右下
};

@interface WDBaseView : UIView

@property (nonatomic, assign) WDBaseViewBenchmarkType         benchmarkType; ///< 从哪一个基准点开始
@property (nonatomic, assign) CGFloat         pendantViewID; ///< 挂件View 唯一标识ID
@property (nonatomic, assign) CGFloat         levelWeight; ///< 水平权重  同一行 水平的排序 位置
@property (nonatomic, assign) CGFloat         verticalWeight; ///< 竖直权重 在第几行的排序
@property (nonatomic, assign) CGFloat         levelMager; ///< 与上一个View的水平方向的间距
@property (nonatomic, assign) CGFloat         verticalMager; ///< 与上一个View的竖直方向的间距
@property (nonatomic, assign) CGFloat         width; ///< view宽度
@property (nonatomic, assign) CGFloat         height; ///< view高度

@end

NS_ASSUME_NONNULL_END
