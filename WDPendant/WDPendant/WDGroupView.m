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

- (void)addsonView:(WDBaseView *)sonView {

    [self.leftTopSonViewArray addObject:sonView];
    [self updateleftTopAllLayoutView];
}


- (void)addALLSonView:(NSMutableArray<WDBaseView *> *)set {


    [self.leftTopSonViewArray addObjectsFromArray:set];


    [self updateleftTopAllLayoutView];

}



- (NSMutableArray<WDBaseView *> *)leftTopSonViewArray {
    if (!_leftTopSonViewArray) {
        _leftTopSonViewArray = [[NSMutableArray alloc] init];
    }
    return _leftTopSonViewArray;
}

@end




//    self.itemArray = itemArray;
//    CGFloat manager = (width - K_num * K_itemBtn_w)/(K_num - 1);
//    // 布局
//    for (int i = 0; i < itemArray.count; i++) {
//        YXLiveNearSelectItemListModel *model = [itemArray yxt_unknownObjectAtIndex:i];
//        UIButton *itemBtn = [self creatItemButtonTitle:model.itemName];
//        itemBtn.tag = model.itemID;
//        [itemBtn addTarget:self action:@selector(itemBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:itemBtn];
//        NSInteger row = i / K_num; // 行
//        NSInteger low = i % K_num; // 列
//        CGFloat top_m = row * (K_itemBtn_h + K_itemBtn_m);
//        CGFloat left_m = low * (K_itemBtn_w + manager);
//        [itemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self).offset(top_m);
//            make.left.equalTo(self).offset(left_m);
//            make.width.mas_equalTo(K_itemBtn_w);
//            make.height.mas_equalTo(K_itemBtn_h);
//        }];
//        [self.allItemArray addObject:itemBtn];
//    }


