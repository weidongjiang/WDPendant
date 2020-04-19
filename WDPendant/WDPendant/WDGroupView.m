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

@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *leftTopSonViewArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightBottomSonViewArray; ///< <#value#>
@property (nonatomic, strong) NSMutableArray<WDBaseView *>         *rightTopSonViewArray; ///< <#value#>

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

- (void)updateleftTopAllLayoutView {


    CGFloat x = 0;
    CGFloat y = 0;

//    CGFloat levelWeight = 1;
    CGFloat verticalWeight = 1;
    CGFloat upHeight = 0;

    for (int i = 0; i < self.leftTopSonViewArray.count; i++) {

        WDBaseView *objView = self.leftTopSonViewArray[i];
        [self addSubview:objView];

        CGFloat width = objView.width;
        CGFloat height = objView.height;
        CGFloat levelMager = objView.levelMager;
        CGFloat verticalMager = objView.verticalMager;

//        CGFloat _levelWeight = objView.levelWeight;
        CGFloat _verticalWeight = objView.verticalWeight;

        if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
            y = y + verticalMager + upHeight;
            verticalWeight = _verticalWeight;
            x = 0;
        }

        [objView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(x);
            make.top.equalTo(self).offset(y);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];

        if (height > upHeight) {// 更新y方向的高度
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

- (void)addPendantView:(WDBaseView *)pendantView {

//    [self.leftTopSonViewArray addObject:pendantView];
//    [self updateleftTopAllLayoutView];
}


- (void)addLeftTopPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray {



    [self.leftTopSonViewArray addObjectsFromArray:[self sortArray:pendantViewArray]];

    [self updateleftTopAllLayoutView];

}



- (void)addRightBottomPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray {

    [self.rightBottomSonViewArray addObjectsFromArray:[self sortArray:pendantViewArray]];
    [self updateRightBottomAllLayoutView];

}

- (void)updateRightBottomAllLayoutView {

    CGFloat x = 0;
        CGFloat y = 0;

    //    CGFloat levelWeight = 1;
        CGFloat verticalWeight = 1;
        CGFloat upHeight = 0;

        for (int i = 0; i < self.rightBottomSonViewArray.count; i++) {

            WDBaseView *objView = self.rightBottomSonViewArray[i];
            [self addSubview:objView];

            CGFloat width = objView.width;
            CGFloat height = objView.height;
            CGFloat levelMager = objView.levelMager;
            CGFloat verticalMager = objView.verticalMager;

    //        CGFloat _levelWeight = objView.levelWeight;
            CGFloat _verticalWeight = objView.verticalWeight;

            if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
                y = y + verticalMager + upHeight;
                verticalWeight = _verticalWeight;
                x = 0;
            }

            [objView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-x);
                make.bottom.equalTo(self).offset(-y);
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(height);
            }];

            if (height > upHeight) {// 更新y方向的高度
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


- (void)addRightTopPendantView:(NSMutableArray<WDBaseView *> *)pendantViewArray {

    [self.rightTopSonViewArray addObjectsFromArray:[self sortArray:pendantViewArray]];
    [self updateRightTopAllLayoutView];
}

- (void)updateRightTopAllLayoutView {


    CGFloat x = 0;
        CGFloat y = 0;

    //    CGFloat levelWeight = 1;
        CGFloat verticalWeight = 1;
        CGFloat upHeight = 0;

        for (int i = 0; i < self.rightTopSonViewArray.count; i++) {

            WDBaseView *objView = self.rightTopSonViewArray[i];
            [self addSubview:objView];

            CGFloat width = objView.width;
            CGFloat height = objView.height;
            CGFloat levelMager = objView.levelMager;
            CGFloat verticalMager = objView.verticalMager;

    //        CGFloat _levelWeight = objView.levelWeight;
            CGFloat _verticalWeight = objView.verticalWeight;

            if (_verticalWeight > verticalWeight) { // 控制行号 到下一行
                y = y + verticalMager + upHeight;
                verticalWeight = _verticalWeight;
                x = 0;
            }

            [objView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-x);
                make.top.equalTo(self).offset(y);
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(height);
            }];

            if (height > upHeight) {// 更新y方向的高度
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

-(NSComparisonResult)comparePendantView:(WDBaseView *)pendantObj1 pendantObj2:(WDBaseView *)pendantObj2 {
 
    // 竖直方向的确定是哪一行
    NSComparisonResult result = [[NSNumber numberWithInt:pendantObj1.verticalWeight] compare:[NSNumber numberWithInt:pendantObj2.verticalWeight]];
    //如果是同一行，确定每一行的顺序]
     if (result == NSOrderedSame) {
         result = [[NSNumber numberWithInt:pendantObj1.levelWeight] compare:[NSNumber numberWithInt:pendantObj2.levelWeight]];
     }

     return result;
}




- (NSMutableArray<WDBaseView *> *)leftTopSonViewArray {
    if (!_leftTopSonViewArray) {
        _leftTopSonViewArray = [[NSMutableArray alloc] init];
    }
    return _leftTopSonViewArray;
}

- (NSMutableArray<WDBaseView *> *)rightBottomSonViewArray {
    if (!_rightBottomSonViewArray) {
        _rightBottomSonViewArray = [[NSMutableArray alloc] init];
    }
    return _rightBottomSonViewArray;
}

- (NSMutableArray<WDBaseView *> *)rightTopSonViewArray {
    if (!_rightTopSonViewArray) {
        _rightTopSonViewArray = [[NSMutableArray alloc] init];
    }
    return _rightTopSonViewArray;
}

@end
