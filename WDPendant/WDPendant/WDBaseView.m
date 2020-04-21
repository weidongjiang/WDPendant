//
//  WDBaseView.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/17.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDBaseView.h"
#import "Masonry.h"

@interface WDBaseView ()
@property (nonatomic, strong) UILabel *lab; ///< <#value#>
@end

@implementation WDBaseView
- (instancetype)init {
    self = [super init];
    if (self) {
        self.isRetract = YES;
        [self setupView];
    }
    return self;
}

- (void)setupView {

    // 布局
    UILabel *lab = [[UILabel alloc] init];
    lab.textColor = [UIColor blackColor];
    lab.font = [UIFont systemFontOfSize:12];
    [self addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.lab = lab;
    // 约束
    [self setAllLayoutView];
}

- (void)setAllLayoutView {

    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)setTestlabelText:(NSString *)testlabelText {
    _testlabelText = testlabelText;
    self.lab.text = testlabelText;
}

- (void)addPendantSubview:(UIView *)view {
    
}

- (void)updatePendantLayout:(CGPoint)point {

}

@end
