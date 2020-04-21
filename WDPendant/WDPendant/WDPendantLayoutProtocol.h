//
//  WDPendantLayoutProtocol.h
//  WDPendant
//
//  Created by yixiajwd on 2020/4/20.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,WDBaseViewBenchmarkType) {
    WDBaseViewBenchmarkTypeLeftTop = 1, // 左上
    WDBaseViewBenchmarkTypeLeftBottom = 2, // 右下
    WDBaseViewBenchmarkTypeRightTop = 3, // 右上
    WDBaseViewBenchmarkTypeRightBottom = 4, // 右下
};

@protocol WDPendantLayoutProtocol <NSObject>


- (WDBaseViewBenchmarkType)pendantBenchmarkType;///< 从哪一个基准点开始
- (CGFloat)pendantID;///< 挂件View 唯一标识ID
- (CGFloat)pendantLevelWeight;///< 水平权重  同一行 水平的排序 位置
- (CGFloat)pendantVerticalWeight;///< 竖直权重 在第几行的排序  在第几行 pendantVerticalWeight
- (CGFloat)pendantLevelMargin;///< 与上一个View的水平方向的间距
- (CGFloat)pendantVerticalMargin;///< 与上一个View的竖直方向的间距Margin
- (CGFloat)pendantWidth;///< view宽度
- (CGFloat)pendantHeight;///< view高度



@end



//margin

//@property (nonatomic, assign) WDBaseViewBenchmarkType         benchmarkType; ///< 从哪一个基准点开始
//@property (nonatomic, assign) CGFloat         pendantViewID; ///< 挂件View 唯一标识ID
//@property (nonatomic, assign) CGFloat         levelWeight; ///< 水平权重  同一行 水平的排序 位置
//@property (nonatomic, assign) CGFloat         verticalWeight; ///< 竖直权重 在第几行的排序
//@property (nonatomic, assign) CGFloat         levelMager; ///< 与上一个View的水平方向的间距
//@property (nonatomic, assign) CGFloat         verticalMager; ///< 与上一个View的竖直方向的间距Margin
//@property (nonatomic, assign) CGFloat         width; ///< view宽度
//@property (nonatomic, assign) CGFloat         height; ///< view高度
//
//@property (nonatomic, copy) NSString           *testlabelText; ///<  <#value#>
