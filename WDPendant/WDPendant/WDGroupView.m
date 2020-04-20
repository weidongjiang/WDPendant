//
//  WDGroupView.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/17.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDGroupView.h"
#import "Masonry.h"

@interface WDGroupView ()

@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *leftTopPendantViewArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightBottomPendantViewArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightTopPendantViewArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *pendantArray; ///< <#value#>

@end


@implementation WDGroupView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {

    // 布局

}

- (void)addPendantView:(WDBaseView *)pendantView {
    @synchronized (self.pendantArray) {
        [self.pendantArray addObject:pendantView];
    }

    [self addPendantViewArray:self.pendantArray];
}

- (void)removePendantView:(WDBaseView *)pendantView {
    for (WDBaseView *objcview in self.pendantArray) {
        if (objcview.pendantViewID == pendantView.pendantViewID && objcview.benchmarkType == pendantView.benchmarkType) {
            @synchronized (self.pendantArray) {
                [self.pendantArray removeObject:objcview];
            }
            break;
        }
    }
    [self addPendantViewArray:self.pendantArray];
}

- (void)updatePendantView:(WDBaseView *)pendantView {
    for (int i = 0; i < self.pendantArray.count; i++) {
        WDBaseView *objcview = self.pendantArray[i];
        if (objcview.pendantViewID == pendantView.pendantViewID && objcview.benchmarkType == pendantView.benchmarkType) {
            @synchronized (self.pendantArray) {
                [self.pendantArray replaceObjectAtIndex:i withObject:pendantView];
            }
            break;
        }
    }

    [self addPendantViewArray:self.pendantArray];
}

- (BOOL)getPendantView:(WDBaseView *)pendantView {
    for (int i = 0; i < self.pendantArray.count; i++) {
        WDBaseView *objcview = self.pendantArray[i];
        if (objcview.pendantViewID == pendantView.pendantViewID && objcview.benchmarkType == pendantView.benchmarkType) {
            return YES;
        }
    }
    return NO;
}


- (void)addPendantViewArray:(NSMutableArray<WDBaseView *> *)pendantViewArray {

    if (!pendantViewArray.count) {
        return;
    }

    for (WDBaseView *objcview in self.subviews) {
        [objcview removeFromSuperview];
    }

    @synchronized (self.leftTopPendantViewArray) {
        [self.leftTopPendantViewArray removeAllObjects];
    }
    @synchronized (self.rightTopPendantViewArray) {
        [self.rightTopPendantViewArray removeAllObjects];
    }
    @synchronized (self.rightBottomPendantViewArray) {
        [self.rightBottomPendantViewArray removeAllObjects];
    }
    @synchronized (self.pendantArray) {
        [self.pendantArray removeAllObjects];
    }

    for (int i = 0; i < pendantViewArray.count; i++) {
        WDBaseView *p_view = pendantViewArray[i];
        if (p_view.benchmarkType == WDBaseViewBenchmarkTypeLeftTop) {
            @synchronized (self.leftTopPendantViewArray) {
                [self.leftTopPendantViewArray addObject:p_view];
            }
        }else if (p_view.benchmarkType == WDBaseViewBenchmarkTypeRightTop) {
            @synchronized (self.rightTopPendantViewArray) {
                [self.rightTopPendantViewArray addObject:p_view];
            }
        }else if (p_view.benchmarkType == WDBaseViewBenchmarkTypeRightBottom) {
            @synchronized (self.rightBottomPendantViewArray) {
                [self.rightBottomPendantViewArray addObject:p_view];
            }
        }
    }

    [self updateLayoutPendantViewArray:[self sortArray:self.leftTopPendantViewArray]];
    [self updateLayoutPendantViewArray:[self sortArray:self.rightTopPendantViewArray]];
    [self updateLayoutPendantViewArray:[self sortArray:self.rightBottomPendantViewArray]];

    @synchronized (self.pendantArray) {
        [self.pendantArray addObjectsFromArray:self.leftTopPendantViewArray];
        [self.pendantArray addObjectsFromArray:self.rightTopPendantViewArray];
        [self.pendantArray addObjectsFromArray:self.rightBottomPendantViewArray];
        self.pendantArray = [[self sortArray:self.pendantArray] mutableCopy];
    }
}


- (void)updateLayoutPendantViewArray:(NSArray *)pendantViewArray {

    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat verticalWeight = 1;
    CGFloat upHeight = 0;
    NSInteger lineMum = 0;


    for (int i = 0; i < pendantViewArray.count; i++) {

        WDBaseView *objView = pendantViewArray[i];
        [self addSubview:objView];

        CGFloat width = objView.width;
        CGFloat height = objView.height;
        CGFloat levelMager = objView.levelMager;
        CGFloat verticalMager = objView.verticalMager;
        CGFloat _verticalWeight = objView.verticalWeight;
        WDBaseViewBenchmarkType type = objView.benchmarkType;

        if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
            y = y + verticalMager + upHeight;
            verticalWeight = _verticalWeight;
            x = 0;
            lineMum = 1;
        }else if (_verticalWeight == verticalWeight) {
            lineMum++;
        }

        if (type == WDBaseViewBenchmarkTypeLeftTop) {
            [objView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(x);
                make.top.equalTo(self).offset(y);
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(height);
            }];
        }else if (type == WDBaseViewBenchmarkTypeRightTop) {
            [objView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-x);
                make.top.equalTo(self).offset(y);
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(height);
            }];
        }else if (type == WDBaseViewBenchmarkTypeRightBottom) {
            [objView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-x);
                make.bottom.equalTo(self).offset(-y);
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(height);
            }];
        }

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

    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];

}

- (NSArray *)sortArray:(NSArray *)array {

    NSArray *sorArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [self comparePendantView:obj1 pendantObj2:obj2];
    }];
    return sorArray;

}

- (NSComparisonResult)comparePendantView:(WDBaseView *)pendantObj1 pendantObj2:(WDBaseView *)pendantObj2 {
 
    // 竖直方向的确定是哪一行
    NSComparisonResult result = [[NSNumber numberWithInt:pendantObj1.verticalWeight] compare:[NSNumber numberWithInt:pendantObj2.verticalWeight]];
    //如果是同一行，确定每一行的顺序]
     if (result == NSOrderedSame) {
         result = [[NSNumber numberWithInt:pendantObj1.levelWeight] compare:[NSNumber numberWithInt:pendantObj2.levelWeight]];
     }
     return result;
}

- (NSMutableArray<WDBaseView *> *)leftTopPendantViewArray {
    if (!_leftTopPendantViewArray) {
        _leftTopPendantViewArray = [[NSMutableArray alloc] init];
    }
    return _leftTopPendantViewArray;
}

- (NSMutableArray<WDBaseView *> *)rightBottomPendantViewArray {
    if (!_rightBottomPendantViewArray) {
        _rightBottomPendantViewArray = [[NSMutableArray alloc] init];
    }
    return _rightBottomPendantViewArray;
}

- (NSMutableArray<WDBaseView *> *)rightTopPendantViewArray {
    if (!_rightTopPendantViewArray) {
        _rightTopPendantViewArray = [[NSMutableArray alloc] init];
    }
    return _rightTopPendantViewArray;
}

- (NSMutableArray<WDBaseView *> *)pendantArray {
    if (!_pendantArray) {
        _pendantArray = [[NSMutableArray alloc] init];
    }
    return _pendantArray;
}


@end





//
//
//- (void)updateleftTopAllLayoutView {
//
//
//    CGFloat x = 0;
//    CGFloat y = 0;
//
////    CGFloat levelWeight = 1;
//    CGFloat verticalWeight = 1;
//    CGFloat upHeight = 0;
//    NSInteger lineMum = 0;
//
//    for (int i = 0; i < self.leftTopPendantViewArray.count; i++) {
//
//        WDBaseView *objView = self.leftTopPendantViewArray[i];
//        [self addSubview:objView];
//
//        CGFloat width = objView.width;
//        CGFloat height = objView.height;
//        CGFloat levelMager = objView.levelMager;
//        CGFloat verticalMager = objView.verticalMager;
//
////        CGFloat _levelWeight = objView.levelWeight;
//        CGFloat _verticalWeight = objView.verticalWeight;
//
//        if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
//            y = y + verticalMager + upHeight;
//            verticalWeight = _verticalWeight;
//            x = 0;
//            lineMum = 1;
//        }else if (_verticalWeight == verticalWeight) {
//            lineMum++;
//        }
//
//        [objView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).offset(x);
//            make.top.equalTo(self).offset(y);
//            make.width.mas_equalTo(width);
//            make.height.mas_equalTo(height);
//        }];
//
//        if (lineMum > 1) {// 更新y方向的高度,有两个以上
//            if (height > upHeight) {
//                upHeight = height;
//            }
//        }else {// 每一行只有一个View
//            upHeight = height;
//        }
//
//        if (_verticalWeight == verticalWeight) {// 同一行
//            x = x + levelMager + width;
//        }
//    }
//
//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
//    [self layoutIfNeeded];
//}
//
//- (void)addPendantView:(WDBaseView *)pendantView {
//
////    [self.leftTopSonViewArray addObject:pendantView];
////    [self updateleftTopAllLayoutView];
//}
//
//
//- (void)addLeftTopPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray {
//
//
//
//    [self.leftTopPendantViewArray addObjectsFromArray:[self sortArray:pendantViewArray]];
//
//    [self updateleftTopAllLayoutView];
//
//}
//
//
//
//- (void)addRightBottomPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray {
//
//    [self.rightBottomPendantViewArray addObjectsFromArray:[self sortArray:pendantViewArray]];
//    [self updateRightBottomAllLayoutView];
//
//}
//
//- (void)updateRightBottomAllLayoutView {
//
//    CGFloat x = 0;
//        CGFloat y = 0;
//
//    //    CGFloat levelWeight = 1;
//        CGFloat verticalWeight = 1;
//        CGFloat upHeight = 0;
//
//        for (int i = 0; i < self.rightBottomPendantViewArray.count; i++) {
//
//            WDBaseView *objView = self.rightBottomPendantViewArray[i];
//            [self addSubview:objView];
//
//            CGFloat width = objView.width;
//            CGFloat height = objView.height;
//            CGFloat levelMager = objView.levelMager;
//            CGFloat verticalMager = objView.verticalMager;
//
//    //        CGFloat _levelWeight = objView.levelWeight;
//            CGFloat _verticalWeight = objView.verticalWeight;
//
//            if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
//                y = y + verticalMager + upHeight;
//                verticalWeight = _verticalWeight;
//                x = 0;
//            }
//
//            [objView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.equalTo(self).offset(-x);
//                make.bottom.equalTo(self).offset(-y);
//                make.width.mas_equalTo(width);
//                make.height.mas_equalTo(height);
//            }];
//
//
//            if (_verticalWeight == verticalWeight) {// 同一行
//                x = x + levelMager + width;
////                if (height > upHeight) {// 更新y方向的高度 获取同一行的最高高度
//                    upHeight = height;
//
////                }
//            }
//        }
//
//        [self setNeedsUpdateConstraints];
//        [self updateConstraintsIfNeeded];
//        [self layoutIfNeeded];
//
//}
//
//
//- (void)addRightTopPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray {
//
//    [self.rightTopPendantViewArray addObjectsFromArray:[self sortArray:pendantViewArray]];
//    [self updateRightTopAllLayoutView];
//}
//
//- (void)updateRightTopAllLayoutView {
//
//
//    CGFloat x = 0;
//        CGFloat y = 0;
//
//    //    CGFloat levelWeight = 1;
//        CGFloat verticalWeight = 1;
//        CGFloat upHeight = 0;
//
//        for (int i = 0; i < self.rightTopPendantViewArray.count; i++) {
//
//            WDBaseView *objView = self.rightTopPendantViewArray[i];
//            [self addSubview:objView];
//
//            CGFloat width = objView.width;
//            CGFloat height = objView.height;
//            CGFloat levelMager = objView.levelMager;
//            CGFloat verticalMager = objView.verticalMager;
//
//    //        CGFloat _levelWeight = objView.levelWeight;
//            CGFloat _verticalWeight = objView.verticalWeight;
//
//            if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
//                y = y + verticalMager + upHeight;
//                verticalWeight = _verticalWeight;
//                x = 0;
//            }
//
//            [objView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.equalTo(self).offset(-x);
//                make.top.equalTo(self).offset(y);
//                make.width.mas_equalTo(width);
//                make.height.mas_equalTo(height);
//            }];
//
////            if (height > upHeight) {// 更新y方向的高度
////            }
//
//            if (_verticalWeight == verticalWeight) {// 同一行
//                x = x + levelMager + width;
//                upHeight = height;
//            }
//        }
//
//        [self setNeedsUpdateConstraints];
//        [self updateConstraintsIfNeeded];
//        [self layoutIfNeeded];
//
//}
