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
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *leftBottomPendantArray; ///< <#value#>

@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *leftTopPendantItemArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightBottomPendantItemArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightTopPendantItemArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *leftBottomPendantItemArray; ///< <#value#>

@end


@implementation WDPendantManager

- (void)addPendantView:(WDBaseView *)pendantView {

    WDBaseViewBenchmarkType pendantBenchmarkType = pendantView.pendantBenchmarkType;

    if (pendantBenchmarkType == WDBaseViewBenchmarkTypeLeftTop) {
        [self _addPendantView:pendantView pendantArray:self.leftTopPendantArray pendantItemArray:self.leftTopPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeRightTop) {
        [self _addPendantView:pendantView pendantArray:self.rightTopPendantArray pendantItemArray:self.rightTopPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeRightBottom) {
        [self _addPendantView:pendantView pendantArray:self.rightBottomPendantArray pendantItemArray:self.rightBottomPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeLeftBottom) {
        [self _addPendantView:pendantView pendantArray:self.leftBottomPendantArray pendantItemArray:self.leftBottomPendantItemArray];
    }
}

- (void)_addPendantView:(WDBaseView *)pendantView pendantArray:(NSMutableArray *)pendantArray pendantItemArray:(NSMutableArray *)pendantItemArray {
    @synchronized (pendantArray) {
        [pendantArray addObject:pendantView];
    }
    [self removeFromSuperviewAndPendantItemArray:pendantItemArray];
    [self updateLayoutPendantViewArray:[self sortArray:pendantArray]];
}


- (void)removePendantView:(WDBaseView *)pendantView {

    WDBaseViewBenchmarkType pendantBenchmarkType = pendantView.pendantBenchmarkType;

    if (pendantBenchmarkType == WDBaseViewBenchmarkTypeLeftTop) {
        [self _removePendantView:pendantView pendantArray:self.leftTopPendantArray pendantItemArray:self.leftTopPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeRightTop) {
        [self _removePendantView:pendantView pendantArray:self.rightTopPendantArray pendantItemArray:self.rightTopPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeRightBottom) {
        [self _removePendantView:pendantView pendantArray:self.rightBottomPendantArray pendantItemArray:self.rightBottomPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeLeftBottom) {
        [self _removePendantView:pendantView pendantArray:self.leftBottomPendantArray pendantItemArray:self.leftBottomPendantItemArray];
    }
}


- (void)_removePendantView:(WDBaseView *)pendantView
              pendantArray:(NSMutableArray *)pendantArray
          pendantItemArray:(NSMutableArray *)pendantItemArray {

    WDBaseViewBenchmarkType pendantBenchmarkType = pendantView.pendantBenchmarkType;
    CGFloat pendantView_pendantID = pendantView.pendantID;

    for (WDBaseView *objcview in pendantArray) {
        if (objcview.pendantID == pendantView_pendantID && objcview.pendantBenchmarkType == pendantBenchmarkType) {
            if (pendantView.isRetract) {
                @synchronized (pendantArray) {
                    [pendantArray removeObject:objcview];
                }
            }
            // 删除View 和 临时数组
            [self removeFromSuperviewAndPendantItemArray:pendantItemArray];
            [self updateLayoutPendantViewArray:[self sortArray:pendantArray]];
            if (!pendantView.isRetract) {
                [pendantView removeFromSuperview];
            }
            break;
        }
    }
}

- (void)updatePendantView:(WDBaseView *)pendantView {

    WDBaseViewBenchmarkType pendantBenchmarkType = pendantView.pendantBenchmarkType;

    if (pendantBenchmarkType == WDBaseViewBenchmarkTypeLeftTop) {
        [self _updatePendantView:pendantView pendantArray:self.leftTopPendantArray pendantItemArray:self.leftTopPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeRightTop) {
        [self _updatePendantView:pendantView pendantArray:self.rightTopPendantArray pendantItemArray:self.rightTopPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeRightBottom) {
        [self _updatePendantView:pendantView pendantArray:self.rightBottomPendantArray pendantItemArray:self.rightBottomPendantItemArray];
    }else if (pendantBenchmarkType == WDBaseViewBenchmarkTypeLeftBottom) {
        [self _updatePendantView:pendantView pendantArray:self.leftBottomPendantArray pendantItemArray:self.leftBottomPendantItemArray];
    }
}

- (void)_updatePendantView:(WDBaseView *)pendantView
              pendantArray:(NSMutableArray *)pendantArray
          pendantItemArray:(NSMutableArray *)pendantItemArray {
    WDBaseViewBenchmarkType pendantBenchmarkType = pendantView.pendantBenchmarkType;
    CGFloat pendantView_pendantID = pendantView.pendantID;
    for (int i = 0; i < pendantArray.count; i++) {
        WDBaseView *objcview = pendantArray[i];
        if (objcview.pendantID == pendantView_pendantID && objcview.pendantBenchmarkType == pendantBenchmarkType) {
            @synchronized (pendantArray) {
                [pendantArray replaceObjectAtIndex:i withObject:pendantView];
            }
            // 删除View 和 临时数组
            [self removeFromSuperviewAndPendantItemArray:pendantItemArray];
            [self updateLayoutPendantViewArray:[self sortArray:pendantArray]];
            break;
        }
    }
}


- (void)movePendantView:(WDBaseView *)pendantView
      formBenchmarkType:(WDBaseViewBenchmarkType)formBenchmarkType
        toBenchmarkType:(WDBaseViewBenchmarkType)toBenchmarkType {

    [self isHavePendantView:pendantView pendantItemArray:self.leftTopPendantItemArray formBenchmarkType:formBenchmarkType toBenchmarkType:toBenchmarkType];
    [self isHavePendantView:pendantView pendantItemArray:self.leftBottomPendantItemArray formBenchmarkType:formBenchmarkType toBenchmarkType:toBenchmarkType];
    [self isHavePendantView:pendantView pendantItemArray:self.rightTopPendantItemArray formBenchmarkType:formBenchmarkType toBenchmarkType:toBenchmarkType];
    [self isHavePendantView:pendantView pendantItemArray:self.rightBottomPendantItemArray formBenchmarkType:formBenchmarkType toBenchmarkType:toBenchmarkType];

    pendantView.pendantBenchmarkType = toBenchmarkType;
    pendantView.isRetract = YES;
    [self addPendantView:pendantView];
}

- (WDBaseView *)isHavePendantView:(WDBaseView *)pendantView
                 pendantItemArray:(NSMutableArray *)PendantItemArray
                formBenchmarkType:(WDBaseViewBenchmarkType)formBenchmarkType
                  toBenchmarkType:(WDBaseViewBenchmarkType)toBenchmarkType {
    for (int i = 0; i < PendantItemArray.count; i++) {
        WDBaseView *objcview = PendantItemArray[i];
        if (objcview.pendantID == pendantView.pendantID && formBenchmarkType == objcview.pendantBenchmarkType) {
            [self removePendantView:objcview];
            return pendantView;
        }
    }
    return nil;
}

- (BOOL)isHavePendantView:(WDBaseView *)pendantView {
    BOOL isHaveLeftTop = [self getPendantView:pendantView pendantItemArray:self.leftTopPendantItemArray];
    BOOL isHaveLeftBottom = [self getPendantView:pendantView pendantItemArray:self.leftBottomPendantItemArray];
    BOOL isHaveRightTop = [self getPendantView:pendantView pendantItemArray:self.rightTopPendantItemArray];
    BOOL isHaveRightBottom = [self getPendantView:pendantView pendantItemArray:self.rightBottomPendantItemArray];
    if (isHaveLeftTop || isHaveLeftBottom || isHaveRightTop || isHaveRightBottom) {
        return YES;
    }
    return NO;
}

- (BOOL)getPendantView:(WDBaseView *)pendantView pendantItemArray:(NSMutableArray *)PendantItemArray {
    for (int i = 0; i < PendantItemArray.count; i++) {
        WDBaseView *objcview = PendantItemArray[i];
        if (objcview.pendantID == pendantView.pendantID && objcview.pendantBenchmarkType == pendantView.pendantBenchmarkType) {
            return YES;
        }
    }
    return NO;
}


- (void)removeFromSuperviewAndPendantItemArray:(NSMutableArray *)pendantItemArray {
    @synchronized (pendantItemArray) {
        for (__strong WDBaseView *p_view in pendantItemArray) {
            if (p_view) {
                [p_view removeFromSuperview];
                p_view = nil;
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
        if (objView.superview) {
            objView.pendantSuperView = objView.superview;
        }
        if (!objView.superview && objView.isRetract) {
            NSAssert(objView.pendantSuperView,@"没有找到父View");
            [objView.pendantSuperView addSubview:objView];
        }

        [objView willUpdatePendantLayout:objView];

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
            if (objView.isRetract) {
                [objView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(objView.superview).offset(x);
                    make.top.equalTo(objView.superview).offset(y);
                    make.width.mas_equalTo(width);
                    make.height.mas_equalTo(height);
                }];
            }

        }else if (type == WDBaseViewBenchmarkTypeRightTop) {
            [self.rightTopPendantItemArray addObject:objView];
            point.x = -x;
            point.y = y;
            if (objView.isRetract) {
                [objView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(objView.superview).offset(x);
                    make.top.equalTo(objView.superview).offset(y);
                    make.width.mas_equalTo(width);
                    make.height.mas_equalTo(height);
                }];
            }
        }else if (type == WDBaseViewBenchmarkTypeRightBottom) {
            [self.rightBottomPendantItemArray addObject:objView];
            point.x = -x;
            point.y = -y;
            if (objView.isRetract) {
                [objView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(objView.superview).offset(x);
                    make.bottom.equalTo(objView.superview).offset(y);
                    make.width.mas_equalTo(width);
                    make.height.mas_equalTo(height);
                }];
            }
        }else if (type == WDBaseViewBenchmarkTypeLeftBottom) {
            [self.leftBottomPendantItemArray addObject:objView];
            point.x = x;
            point.y = -y;
            if (objView.isRetract) {
                [objView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(objView.superview).offset(x);
                    make.bottom.equalTo(objView.superview).offset(y);
                    make.width.mas_equalTo(width);
                    make.height.mas_equalTo(height);
                }];
            }
        }
        [objView.superview layoutIfNeeded];
        [objView layoutIfNeeded];
        [objView didUpdatePendantLayout:objView];

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

- (NSMutableArray<WDBaseView *> *)leftBottomPendantArray {
    if (!_leftBottomPendantArray) {
        _leftBottomPendantArray = [[NSMutableArray alloc] init];
    }
    return _leftBottomPendantArray;
}

- (NSMutableArray<WDBaseView *> *)leftBottomPendantItemArray {
    if (!_leftBottomPendantItemArray) {
        _leftBottomPendantItemArray = [[NSMutableArray alloc] init];
    }
    return _leftBottomPendantItemArray;
}
@end
