//
//  WDPendantManager.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDPendantManager.h"
#import "Masonry.h"

@interface WDPendantManager ()

@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *leftTopPendantArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightBottomPendantArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightTopPendantArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *leftTopPendantItemArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightBottomPendantItemArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightTopPendantItemArray; ///< <#value#>

@end


@implementation WDPendantManager


- (void)addPendantView:(WDBaseView *)pendantView {

    if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeLeftTop) {
        @synchronized (self.leftTopPendantArray) {
            [self.leftTopPendantArray addObject:pendantView];
        }

        // 删除View 和 临时数组
        [self removeFromSuperviewAndPendantItemArray:self.leftTopPendantItemArray];

        [self updateLayoutPendantViewArray:[self sortArray:self.leftTopPendantArray]];

    }else if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeRightTop) {
        @synchronized (self.rightTopPendantArray) {
            [self.rightTopPendantArray addObject:pendantView];
        }

        // 删除View 和 临时数组
        [self removeFromSuperviewAndPendantItemArray:self.rightTopPendantItemArray];

        [self updateLayoutPendantViewArray:[self sortArray:self.rightTopPendantArray]];

    }else if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeRightBottom) {
        @synchronized (self.rightBottomPendantArray) {
            [self.rightBottomPendantArray addObject:pendantView];
        }

        // 删除View 和 临时数组
        [self removeFromSuperviewAndPendantItemArray:self.rightBottomPendantItemArray];
        [self updateLayoutPendantViewArray:[self sortArray:self.rightBottomPendantArray]];

//        [self.rightBottomPendantItemArray enumerateObjectsUsingBlock:^(WDBaseView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSAssert(![@(obj.pendantViewID).stringValue isEqualToString:@([pendantView pendantID]).stringValue], @"跟别人的ID 重了(%f %f)....换个吧 ",obj.pendantViewID,[pendantView pendantID]);
//        }];
    }
}

//- (void)checkPendantViewID:(NSMutableArray *)pendantItemArray

- (void)removePendantView:(WDBaseView *)pendantView {

    if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeLeftTop) {
        for (WDBaseView *objcview in self.leftTopPendantArray) {
            if ([objcview pendantID] == [pendantView pendantID] && [objcview pendantBenchmarkType] == [pendantView pendantBenchmarkType]) {
                @synchronized (self.leftTopPendantArray) {
                    [self.leftTopPendantArray removeObject:objcview];
                }
                // 删除View 和 临时数组
                [self removeFromSuperviewAndPendantItemArray:self.leftTopPendantItemArray];

                [self updateLayoutPendantViewArray:[self sortArray:self.leftTopPendantArray]];
                break;
            }
        }
    }else if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeRightTop) {
        for (WDBaseView *objcview in self.rightTopPendantArray) {
            if ([objcview pendantID] == [pendantView pendantID] && [objcview pendantBenchmarkType] == [pendantView pendantBenchmarkType]) {
                @synchronized (self.rightTopPendantArray) {
                    [self.rightTopPendantArray removeObject:objcview];
                }

                // 删除View 和 临时数组
                [self removeFromSuperviewAndPendantItemArray:self.rightTopPendantItemArray];
                [self updateLayoutPendantViewArray:[self sortArray:self.rightTopPendantArray]];
                break;
            }
        }
    }else if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeRightBottom) {

        for (WDBaseView *objcview in self.rightBottomPendantArray) {
            if ([objcview pendantID] == [pendantView pendantID] && [objcview pendantBenchmarkType] == [pendantView pendantBenchmarkType]) {
                @synchronized (self.rightBottomPendantArray) {
                    [self.rightBottomPendantArray removeObject:objcview];
                }

                // 删除View 和 临时数组
                [self removeFromSuperviewAndPendantItemArray:self.rightBottomPendantItemArray];
                [self updateLayoutPendantViewArray:[self sortArray:self.rightBottomPendantArray]];
                break;
            }
        }
    }
}


- (void)updatePendantView:(WDBaseView *)pendantView {

    if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeLeftTop) {
        for (int i = 0; i < self.leftTopPendantArray.count; i++) {
            WDBaseView *objcview = self.leftTopPendantArray[i];

            if ([objcview pendantID] == [pendantView pendantID] && [objcview pendantBenchmarkType] == [pendantView pendantBenchmarkType]) {
                @synchronized (self.leftTopPendantArray) {
                    [self.leftTopPendantArray replaceObjectAtIndex:i withObject:pendantView];
                }

                // 删除View 和 临时数组
                [self removeFromSuperviewAndPendantItemArray:self.leftTopPendantItemArray];

                [self updateLayoutPendantViewArray:[self sortArray:self.leftTopPendantArray]];
                break;
            }
        }
    }else if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeRightTop) {

        for (int i = 0; i < self.rightTopPendantArray.count; i++) {
            WDBaseView *objcview = self.rightTopPendantArray[i];

            if ([objcview pendantID] == [pendantView pendantID] && [objcview pendantBenchmarkType] == [pendantView pendantBenchmarkType]) {
                @synchronized (self.rightTopPendantArray) {
                    [self.rightTopPendantArray replaceObjectAtIndex:i withObject:pendantView];
                }

                // 删除View 和 临时数组
                [self removeFromSuperviewAndPendantItemArray:self.rightTopPendantItemArray];

                [self updateLayoutPendantViewArray:[self sortArray:self.rightTopPendantArray]];
                break;
            }
        }
    }else if ([pendantView pendantBenchmarkType] == WDBaseViewBenchmarkTypeRightBottom) {

        for (int i = 0; i < self.rightBottomPendantArray.count; i++) {
            WDBaseView *objcview = self.rightBottomPendantArray[i];

            if ([objcview pendantID] == [pendantView pendantID] && [objcview pendantBenchmarkType] == [pendantView pendantBenchmarkType]) {
                @synchronized (self.rightBottomPendantArray) {
                    [self.rightBottomPendantArray replaceObjectAtIndex:i withObject:pendantView];
                }
                // 删除View 和 临时数组
                [self removeFromSuperviewAndPendantItemArray:self.rightBottomPendantItemArray];

                [self updateLayoutPendantViewArray:[self sortArray:self.rightBottomPendantArray]];
                break;
            }
        }
    }

}

- (BOOL)getPendantView:(WDBaseView *)pendantView {

//    for (int i = 0; i < self.subviews.count; i++) {
//        WDBaseView *objcview = self.subviews[i];
//        if ([objcview pendantID] == [pendantView pendantID] && [objcview pendantBenchmarkType] == [pendantView pendantBenchmarkType]) {
//            return YES;
//        }
//    }
    return NO;
}


- (void)removeFromSuperviewAndPendantItemArray:(NSMutableArray *)pendantItemArray {
    @synchronized (pendantItemArray) {
        for (WDBaseView *p_view in pendantItemArray) {
            if (p_view) {
                [p_view removeFromSuperview];
            }
        }
        [pendantItemArray removeAllObjects];
    }
}


- (void)addPendantViewArray:(NSMutableArray<WDBaseView *> *)pendantViewArray {

//    if (!pendantViewArray.count) {
//        return;
//    }
//
//    for (int i = 0; i < pendantViewArray.count; i++) {
//        WDBaseView *p_view = pendantViewArray[i];
//        if (p_view.benchmarkType == WDBaseViewBenchmarkTypeLeftTop) {
//            @synchronized (self.leftTopPendantArray) {
//                [self.leftTopPendantArray addObject:p_view];
//            }
//        }else if (p_view.benchmarkType == WDBaseViewBenchmarkTypeRightTop) {
//            @synchronized (self.rightTopPendantArray) {
//                [self.rightTopPendantArray addObject:p_view];
//            }
//        }else if (p_view.benchmarkType == WDBaseViewBenchmarkTypeRightBottom) {
//            @synchronized (self.rightBottomPendantArray) {
//                [self.rightBottomPendantArray addObject:p_view];
//            }
//        }
//    }
//
//    [self updateLayoutPendantViewArray:[self sortArray:self.leftTopPendantArray]];
//    [self updateLayoutPendantViewArray:[self sortArray:self.rightTopPendantArray]];
//    [self updateLayoutPendantViewArray:[self sortArray:self.rightBottomPendantArray]];

}


- (void)updateLayoutPendantViewArray:(NSArray *)pendantViewArray {

    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat verticalWeight = 1;
    CGFloat upHeight = 0;
    NSInteger lineMum = 0;

    for (int i = 0; i < pendantViewArray.count; i++) {

        WDBaseView *objView = pendantViewArray[i];
        if (!objView.superview) {
            [objView addPendantSubview:objView.pendantSuperView];
        }

        CGFloat width = objView.pendantWidth;
        CGFloat height = objView.pendantHeight;
        CGFloat levelMager = objView.pendantLevelMargin;
        CGFloat verticalMager = objView.pendantVerticalMargin;
        CGFloat _verticalWeight = objView.pendantLevelWeight;
        WDBaseViewBenchmarkType type = objView.pendantBenchmarkType;


        if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
            y = y + verticalMager + upHeight;
            verticalWeight = _verticalWeight;
            x = 0;
            lineMum = 1;
        }else if (_verticalWeight == verticalWeight) {
            lineMum++;
        }

        CGPoint point = CGPointMake(0, 0);
        if (type == WDBaseViewBenchmarkTypeLeftTop) {
            [self.leftTopPendantItemArray addObject:objView];
            point.x = x;
            point.y = y;
        }else if (type == WDBaseViewBenchmarkTypeRightTop) {
            [self.rightTopPendantItemArray addObject:objView];
            point.x = -x;
            point.y = y;
        }else if (type == WDBaseViewBenchmarkTypeRightBottom) {
            [self.rightBottomPendantItemArray addObject:objView];
            point.x = -x;
            point.y = -y;
        }else if (type == WDBaseViewBenchmarkTypeLeftBottom) {
            point.x = x;
            point.y = -y;
        }

        [objView updatePendantLayout:point];

        if (lineMum > 1) {// 更新y方向的高度,有两个以上
            if (height > upHeight) {
                upHeight = height;
            }
        }else {// 每一行只有一个View
            upHeight = height;
        }

        if (_verticalWeight == verticalWeight) {// 同一行
            x = x + levelMager + width;
        }
    }
}

- (NSArray *)sortArray:(NSArray *)array {

    NSArray *sorArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparePendantView:obj1 pendantObj2:obj2];
    }];
    return sorArray;

}

- (NSComparisonResult)comparePendantView:(WDBaseView *)pendantObj1 pendantObj2:(WDBaseView *)pendantObj2 {

    // 竖直方向的确定是哪一行

    NSComparisonResult result = [[NSNumber numberWithInt:pendantObj1.pendantVerticalWeight] compare:[NSNumber numberWithInt:pendantObj2.pendantVerticalWeight]];
    //如果是同一行，确定每一行的顺序]
     if (result == NSOrderedSame) {

         result = [[NSNumber numberWithInt:pendantObj1.pendantLevelWeight] compare:[NSNumber numberWithInt: pendantObj2.pendantLevelWeight]];
     }
     return result;
}

- (NSMutableArray<WDBaseView *> *)leftTopPendantArray {
    if (!_leftTopPendantArray) {
        _leftTopPendantArray = [[NSMutableArray alloc] init];
    }
    return _leftTopPendantArray;
}

- (NSMutableArray<WDBaseView *> *)rightBottomPendantArray {
    if (!_rightBottomPendantArray) {
        _rightBottomPendantArray = [[NSMutableArray alloc] init];
    }
    return _rightBottomPendantArray;
}

- (NSMutableArray<WDBaseView *> *)rightTopPendantArray {
    if (!_rightTopPendantArray) {
        _rightTopPendantArray = [[NSMutableArray alloc] init];
    }
    return _rightTopPendantArray;
}


- (NSMutableArray<WDBaseView *> *)leftTopPendantItemArray {
    if (!_leftTopPendantItemArray) {
        _leftTopPendantItemArray = [[NSMutableArray alloc] init];
    }
    return _leftTopPendantItemArray;
}

- (NSMutableArray<WDBaseView *> *)rightBottomPendantItemArray {
    if (!_rightBottomPendantItemArray) {
        _rightBottomPendantItemArray = [[NSMutableArray alloc] init];
    }
    return _rightBottomPendantItemArray;
}

- (NSMutableArray<WDBaseView *> *)rightTopPendantItemArray {
    if (!_rightTopPendantItemArray) {
        _rightTopPendantItemArray = [[NSMutableArray alloc] init];
    }
    return _rightTopPendantItemArray;
}


@end
