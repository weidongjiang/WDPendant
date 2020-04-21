//
//  ViewController.m
//  WDPendant
//
//  Created by yixiajwd on 2020/4/17.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "ViewController.h"
#import "WDBaseView.h"
#import "WDGroupView.h"
#import "Masonry.h"
#import "WDHomePendantView.h"
#import "WDMyPendantView.h"
#import "WDMsgPendantView.h"
#import "WDNearPendantView.h"
#import "WDPendantManager.h"

@interface ViewController ()

@property (nonatomic, strong) WDGroupView        *groupView; ///< <#value#>
@property (nonatomic, strong) WDPendantManager        *pendantManager; ///< <#value#>
@property (nonatomic, strong) WDHomePendantView        *homeView; ///< <#value#>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    UIButton *addBtn = [[UIButton alloc] init];
    [addBtn setBackgroundColor:[UIColor blueColor]];
    [addBtn setTitle:@"增" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnDid) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];

    UIButton *removeBtn = [[UIButton alloc] init];
    [removeBtn setBackgroundColor:[UIColor blueColor]];
    [removeBtn setTitle:@"删" forState:UIControlStateNormal];
    [removeBtn addTarget:self action:@selector(removeBtnDid) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeBtn];
    [removeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addBtn.mas_right).offset(2);
        make.bottom.equalTo(addBtn);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];


    UIButton *updateBtn = [[UIButton alloc] init];
    [updateBtn setBackgroundColor:[UIColor blueColor]];
    [updateBtn setTitle:@"改" forState:UIControlStateNormal];
    [updateBtn addTarget:self action:@selector(updateBtnDid) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:updateBtn];
    [updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(removeBtn.mas_right).offset(2);
        make.bottom.equalTo(addBtn);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];


    UIButton *getBtn = [[UIButton alloc] init];
    [getBtn setBackgroundColor:[UIColor blueColor]];
    [getBtn setTitle:@"查" forState:UIControlStateNormal];
    [getBtn addTarget:self action:@selector(getBtnDid) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getBtn];
    [getBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(updateBtn.mas_right).offset(2);
        make.bottom.equalTo(addBtn);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];


    UIButton *_updateBtn = [[UIButton alloc] init];
    [_updateBtn setBackgroundColor:[UIColor blueColor]];
    [_updateBtn setTitle:@"移" forState:UIControlStateNormal];
    [_updateBtn addTarget:self action:@selector(_updateBtnDid) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_updateBtn];
    [_updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addBtn);
        make.bottom.equalTo(addBtn.mas_top).offset(-2);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];


//    [self allview];


    UIView *oneView =  [[UIView alloc] init];
    [self.view addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-100);
    }];

    UIView *towView =  [[UIView alloc] init];
    [self.view addSubview:towView];
    [towView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-100);
    }];


    UIView *threeView =  [[UIView alloc] init];
    [self.view addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-100);
    }];


    WDHomePendantView *homeView = [[WDHomePendantView alloc] init];
//    self.pendantManager.layoutDelegate = homeView;
    homeView.pendantSuperView = oneView;
    self.homeView = homeView;
    [oneView addSubview:homeView];

    [self.pendantManager addPendantView:homeView];


    WDMyPendantView *myView = [[WDMyPendantView alloc] init];
    myView.pendantSuperView = towView;
    [towView addSubview:myView];
    [self.pendantManager addPendantView:myView];


    WDMsgPendantView *msgView = [[WDMsgPendantView alloc] init];
    msgView.pendantSuperView = threeView;
    [threeView addSubview:msgView];
    [self.pendantManager addPendantView:msgView];

}

- (void)_updateBtnDid {
    [self.pendantManager removePendantView:self.homeView];
}

//- (void)_updateBtnDid {
//
//    WDBaseView *view_2_2_RightTop = [[WDBaseView alloc] init];
//    view_2_2_RightTop.backgroundColor = [UIColor redColor];
//    view_2_2_RightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
//    view_2_2_RightTop.levelWeight = 2;
//    view_2_2_RightTop.verticalWeight = 2;
//    view_2_2_RightTop.levelMager = 10;
//    view_2_2_RightTop.verticalMager = 10;
//    view_2_2_RightTop.width = 60;
//    view_2_2_RightTop.height = 60;
//    view_2_2_RightTop.testlabelText = @"红包";
//    view_2_2_RightTop.pendantViewID = 2220;
//
//
//    [self.groupView removePendantView:view_2_2_RightTop];
//
//
//    view_2_2_RightTop.backgroundColor = [UIColor redColor];
//    view_2_2_RightTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_2_2_RightTop.levelWeight = 1;
//    view_2_2_RightTop.verticalWeight = 3;
//    view_2_2_RightTop.levelMager = 10;
//    view_2_2_RightTop.verticalMager = 10;
//    view_2_2_RightTop.width = 60;
//    view_2_2_RightTop.height = 60;
//    view_2_2_RightTop.testlabelText = @"红包";
//    view_2_2_RightTop.pendantViewID = 2220;
//
//    [self.groupView addPendantView:view_2_2_RightTop];
//}
//
//- (void)getBtnDid {
//
//    WDBaseView *view_5_1_leftTop = [[WDBaseView alloc] init];
//    view_5_1_leftTop.backgroundColor = [UIColor redColor];
//    view_5_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_5_1_leftTop.levelWeight = 1;
//    view_5_1_leftTop.verticalWeight = 5;
//    view_5_1_leftTop.levelMager = 10;
//    view_5_1_leftTop.verticalMager = 10;
//    view_5_1_leftTop.width = 80;
//    view_5_1_leftTop.height = 80;
//    view_5_1_leftTop.testlabelText = @"5_1_leftTop";
//    view_5_1_leftTop.pendantViewID = 351;
//
//    BOOL isHave = [self.groupView getPendantView:view_5_1_leftTop];
//    NSLog(@"isHave--%@",@(isHave));
//}
//
//- (void)updateBtnDid {
//
//    WDBaseView *view_4_0_leftTop = [[WDBaseView alloc] init];
//    view_4_0_leftTop.backgroundColor = [UIColor redColor];
//    view_4_0_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_4_0_leftTop.levelWeight = 1;
//    view_4_0_leftTop.verticalWeight = 4;
//    view_4_0_leftTop.levelMager = 10;
//    view_4_0_leftTop.verticalMager = 10;
//    view_4_0_leftTop.width = 100;
//    view_4_0_leftTop.height = 100;
//    view_4_0_leftTop.testlabelText = @"4_0_leftTop";
//    view_4_0_leftTop.pendantViewID = 340;
//
//
//    WDBaseView *view_2_2_RightTop = [[WDBaseView alloc] init];
//    view_2_2_RightTop.backgroundColor = [UIColor redColor];
//    view_2_2_RightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
//    view_2_2_RightTop.levelWeight = 2;
//    view_2_2_RightTop.verticalWeight = 2;
//    view_2_2_RightTop.levelMager = 10;
//    view_2_2_RightTop.verticalMager = 10;
//    view_2_2_RightTop.width = 60;
//    view_2_2_RightTop.height = 60;
//    view_2_2_RightTop.testlabelText = @"红包";
//    view_2_2_RightTop.pendantViewID = 2220;
//
//    WDBaseView *view_3_2_RightBottom = [[WDBaseView alloc] init];
//    view_3_2_RightBottom.backgroundColor = [UIColor redColor];
//    view_3_2_RightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//    view_3_2_RightBottom.levelWeight = 2;
//    view_3_2_RightBottom.verticalWeight = 3;
//    view_3_2_RightBottom.levelMager = 10;
//    view_3_2_RightBottom.verticalMager = 10;
//    view_3_2_RightBottom.width = 150;
//    view_3_2_RightBottom.height = 120;
//    view_3_2_RightBottom.testlabelText = @"3_2_RightBottom";
//    view_3_2_RightBottom.pendantViewID = 3320;
//
//    [self.groupView updatePendantView:view_3_2_RightBottom];
//    [self.groupView updatePendantView:view_4_0_leftTop];
//    [self.groupView updatePendantView:view_2_2_RightTop];
//
//}
//
//- (void)removeBtnDid {
//
//    WDBaseView *view_4_0_leftTop = [[WDBaseView alloc] init];
//    view_4_0_leftTop.backgroundColor = [UIColor redColor];
//    view_4_0_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_4_0_leftTop.levelWeight = 1;
//    view_4_0_leftTop.verticalWeight = 4;
//    view_4_0_leftTop.levelMager = 10;
//    view_4_0_leftTop.verticalMager = 10;
//    view_4_0_leftTop.width = 20;
//    view_4_0_leftTop.height = 20;
//    view_4_0_leftTop.testlabelText = @"4_0_leftTop";
//    view_4_0_leftTop.pendantViewID = 340;
//
//
//    WDBaseView *view_1_2_rightTop = [[WDBaseView alloc] init];
//    view_1_2_rightTop.backgroundColor = [UIColor yellowColor];
//    view_1_2_rightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
//    view_1_2_rightTop.levelWeight = 1;
//    view_1_2_rightTop.verticalWeight = 2;
//    view_1_2_rightTop.levelMager = 10;
//    view_1_2_rightTop.verticalMager = 10;
//    view_1_2_rightTop.width = 100;
//    view_1_2_rightTop.height = 100;
//    view_1_2_rightTop.testlabelText = @"1_2_rightTop";
//    view_1_2_rightTop.pendantViewID = 12;
//
//    WDBaseView *view_1_2_rightBottom = [[WDBaseView alloc] init];
//    view_1_2_rightBottom.backgroundColor = [UIColor yellowColor];
//    view_1_2_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//    view_1_2_rightBottom.levelWeight = 1;
//    view_1_2_rightBottom.verticalWeight = 2;
//    view_1_2_rightBottom.levelMager = 10;
//    view_1_2_rightBottom.verticalMager = 10;
//    view_1_2_rightBottom.width = 80;
//    view_1_2_rightBottom.height = 80;
//    view_1_2_rightBottom.testlabelText = @"1_2_rightBottom";
//    view_1_2_rightBottom.pendantViewID = 212;
//
//    [self.groupView removePendantView:view_4_0_leftTop];
//    [self.groupView removePendantView:view_1_2_rightTop];
//    [self.groupView removePendantView:view_1_2_rightBottom];
//
//
//}
//
//- (void)addBtnDid {
//
//    WDBaseView *view_4_0_leftTop = [[WDBaseView alloc] init];
//    view_4_0_leftTop.backgroundColor = [UIColor redColor];
//    view_4_0_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_4_0_leftTop.levelWeight = 1;
//    view_4_0_leftTop.verticalWeight = 4;
//    view_4_0_leftTop.levelMager = 10;
//    view_4_0_leftTop.verticalMager = 10;
//    view_4_0_leftTop.width = 20;
//    view_4_0_leftTop.height = 20;
//    view_4_0_leftTop.testlabelText = @"4_0_leftTop";
//    view_4_0_leftTop.pendantViewID = 340;
//
//    WDBaseView *view_5_1_leftTop = [[WDBaseView alloc] init];
//    view_5_1_leftTop.backgroundColor = [UIColor redColor];
//    view_5_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_5_1_leftTop.levelWeight = 1;
//    view_5_1_leftTop.verticalWeight = 5;
//    view_5_1_leftTop.levelMager = 10;
//    view_5_1_leftTop.verticalMager = 10;
//    view_5_1_leftTop.width = 80;
//    view_5_1_leftTop.height = 80;
//    view_5_1_leftTop.testlabelText = @"5_1_leftTop";
//    view_5_1_leftTop.pendantViewID = 351;
//
//
//    WDBaseView *view_2_2_RightTop = [[WDBaseView alloc] init];
//    view_2_2_RightTop.backgroundColor = [UIColor redColor];
//    view_2_2_RightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
//    view_2_2_RightTop.levelWeight = 2;
//    view_2_2_RightTop.verticalWeight = 2;
//    view_2_2_RightTop.levelMager = 10;
//    view_2_2_RightTop.verticalMager = 10;
//    view_2_2_RightTop.width = 20;
//    view_2_2_RightTop.height = 20;
//    view_2_2_RightTop.testlabelText = @"2_2_RightTop";
//    view_2_2_RightTop.pendantViewID = 2220;
//
//
//    WDBaseView *view_3_2_RightBottom = [[WDBaseView alloc] init];
//    view_3_2_RightBottom.backgroundColor = [UIColor redColor];
//    view_3_2_RightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//    view_3_2_RightBottom.levelWeight = 2;
//    view_3_2_RightBottom.verticalWeight = 3;
//    view_3_2_RightBottom.levelMager = 10;
//    view_3_2_RightBottom.verticalMager = 10;
//    view_3_2_RightBottom.width = 20;
//    view_3_2_RightBottom.height = 20;
//    view_3_2_RightBottom.testlabelText = @"3_2_RightBottom";
//    view_3_2_RightBottom.pendantViewID = 3320;
//
//    [self.groupView addPendantView:view_3_2_RightBottom];
//
//    [self.groupView addPendantView:view_4_0_leftTop];
//    [self.groupView addPendantView:view_5_1_leftTop];
//    [self.groupView addPendantView:view_2_2_RightTop];
//
//
//
//}
//
//
//- (void)allview {
//
//
//    self.groupView = [[WDGroupView alloc] init];
//    self.groupView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:self.groupView];
//
//    [self.groupView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(10);
//        make.right.equalTo(self.view).offset(-10);
//        make.top.equalTo(self.view).offset(100);
//        make.bottom.equalTo(self.view).offset(-100);
//    }];
//
//    WDBaseView *view_1_1_rightTop = [[WDBaseView alloc] init];
//    view_1_1_rightTop.backgroundColor = [UIColor redColor];
//    view_1_1_rightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
//    view_1_1_rightTop.levelWeight = 1;
//    view_1_1_rightTop.verticalWeight = 1;
//    view_1_1_rightTop.levelMager = 10;
//    view_1_1_rightTop.verticalMager = 10;
//    view_1_1_rightTop.width = 100;
//    view_1_1_rightTop.height = 30;
//    view_1_1_rightTop.testlabelText = @"1_1_rightTop";
//    view_1_1_rightTop.pendantViewID = 11;
//
//    WDBaseView *view_1_2_rightTop = [[WDBaseView alloc] init];
//    view_1_2_rightTop.backgroundColor = [UIColor yellowColor];
//    view_1_2_rightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
//    view_1_2_rightTop.levelWeight = 1;
//    view_1_2_rightTop.verticalWeight = 2;
//    view_1_2_rightTop.levelMager = 10;
//    view_1_2_rightTop.verticalMager = 10;
//    view_1_2_rightTop.width = 100;
//    view_1_2_rightTop.height = 100;
//    view_1_2_rightTop.testlabelText = @"1_2_rightTop";
//    view_1_2_rightTop.pendantViewID = 12;
//
//
//    WDBaseView *view_1_3_rightTop = [[WDBaseView alloc] init];
//    view_1_3_rightTop.backgroundColor = [UIColor greenColor];
//    view_1_3_rightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
//    view_1_3_rightTop.levelWeight = 1;
//    view_1_3_rightTop.verticalWeight = 3;
//    view_1_3_rightTop.levelMager = 10;
//    view_1_3_rightTop.verticalMager = 10;
//    view_1_3_rightTop.width = 50;
//    view_1_3_rightTop.height = 50;
//    view_1_3_rightTop.testlabelText = @"1_3_rightTop";
//    view_1_3_rightTop.pendantViewID = 13;
//
//
//    WDBaseView *view_1_1_rightBottom = [[WDBaseView alloc] init];
//    view_1_1_rightBottom.backgroundColor = [UIColor redColor];
//    view_1_1_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//    view_1_1_rightBottom.levelWeight = 1;
//    view_1_1_rightBottom.verticalWeight = 1;
//    view_1_1_rightBottom.levelMager = 10;
//    view_1_1_rightBottom.verticalMager = 10;
//    view_1_1_rightBottom.width = 100;
//    view_1_1_rightBottom.height = 100;
//    view_1_1_rightBottom.testlabelText = @"1_1_rightBottom";
//    view_1_1_rightBottom.pendantViewID = 211;
//
//
//    WDBaseView *view_1_2_rightBottom = [[WDBaseView alloc] init];
//    view_1_2_rightBottom.backgroundColor = [UIColor yellowColor];
//    view_1_2_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//    view_1_2_rightBottom.levelWeight = 1;
//    view_1_2_rightBottom.verticalWeight = 2;
//    view_1_2_rightBottom.levelMager = 10;
//    view_1_2_rightBottom.verticalMager = 10;
//    view_1_2_rightBottom.width = 80;
//    view_1_2_rightBottom.height = 80;
//    view_1_2_rightBottom.testlabelText = @"1_2_rightBottom";
//    view_1_2_rightBottom.pendantViewID = 212;
//
//
//    WDBaseView *view_1_3_rightBottom = [[WDBaseView alloc] init];
//    view_1_3_rightBottom.backgroundColor = [UIColor greenColor];
//    view_1_3_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//    view_1_3_rightBottom.levelWeight = 1;
//    view_1_3_rightBottom.verticalWeight = 3;
//    view_1_3_rightBottom.levelMager = 10;
//    view_1_3_rightBottom.verticalMager = 10;
//    view_1_3_rightBottom.width = 50;
//    view_1_3_rightBottom.height = 50;
//    view_1_3_rightBottom.testlabelText = @"1_3_rightBottom";
//    view_1_3_rightBottom.pendantViewID = 213;
//
//
//
//
//    WDBaseView *view_1_1_leftTop = [[WDBaseView alloc] init];
//    view_1_1_leftTop.backgroundColor = [UIColor redColor];
//    view_1_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_1_1_leftTop.levelWeight = 1;
//    view_1_1_leftTop.verticalWeight = 1;
//    view_1_1_leftTop.levelMager = 10;
//    view_1_1_leftTop.verticalMager = 10;
//    view_1_1_leftTop.width = 100;
//    view_1_1_leftTop.height = 20;
//    view_1_1_leftTop.testlabelText = @"1_1_leftTop";
//    view_1_1_leftTop.pendantViewID = 311;
//
//
//    WDBaseView *view_1_2_leftTop = [[WDBaseView alloc] init];
//    view_1_2_leftTop.backgroundColor = [UIColor yellowColor];
//    view_1_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_1_2_leftTop.levelWeight = 2;
//    view_1_2_leftTop.verticalWeight = 1;
//    view_1_2_leftTop.levelMager = 10;
//    view_1_2_leftTop.verticalMager = 10;
//    view_1_2_leftTop.width = 50;
//    view_1_2_leftTop.height = 20;
//    view_1_2_leftTop.testlabelText = @"1_2_leftTop";
//    view_1_2_leftTop.pendantViewID = 312;
//
//    WDBaseView *view_1_3_leftTop = [[WDBaseView alloc] init];
//    view_1_3_leftTop.backgroundColor = [UIColor greenColor];
//    view_1_3_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_1_3_leftTop.levelWeight = 3;
//    view_1_3_leftTop.verticalWeight = 1;
//    view_1_3_leftTop.levelMager = 10;
//    view_1_3_leftTop.verticalMager = 10;
//    view_1_3_leftTop.width = 50;
//    view_1_3_leftTop.height = 20;
//    view_1_3_leftTop.testlabelText = @"1_3_leftTop";
//    view_1_3_leftTop.pendantViewID = 313;
//
//
//    WDBaseView *view_2_1_leftTop = [[WDBaseView alloc] init];
//    view_2_1_leftTop.backgroundColor = [UIColor greenColor];
//    view_2_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_2_1_leftTop.levelWeight = 1;
//    view_2_1_leftTop.verticalWeight = 2;
//    view_2_1_leftTop.levelMager = 10;
//    view_2_1_leftTop.verticalMager = 10;
//    view_2_1_leftTop.width = 50;
//    view_2_1_leftTop.height = 20;
//    view_2_1_leftTop.testlabelText = @"2_1_leftTop";
//    view_2_1_leftTop.pendantViewID = 321;
//
//
//    WDBaseView *view_2_2_leftTop = [[WDBaseView alloc] init];
//    view_2_2_leftTop.backgroundColor = [UIColor redColor];
//    view_2_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_2_2_leftTop.levelWeight = 2;
//    view_2_2_leftTop.verticalWeight = 2;
//    view_2_2_leftTop.levelMager = 10;
//    view_2_2_leftTop.verticalMager = 10;
//    view_2_2_leftTop.width = 100;
//    view_2_2_leftTop.height = 20;
//    view_2_2_leftTop.testlabelText = @"2_2_leftTop";
//    view_2_2_leftTop.pendantViewID = 322;
//
//
//    WDBaseView *view_3_1_leftTop = [[WDBaseView alloc] init];
//    view_3_1_leftTop.backgroundColor = [UIColor yellowColor];
//    view_3_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_3_1_leftTop.levelWeight = 3;
//    view_3_1_leftTop.verticalWeight = 3;
//    view_3_1_leftTop.levelMager = 10;
//    view_3_1_leftTop.verticalMager = 10;
//    view_3_1_leftTop.width = 100;
//    view_3_1_leftTop.height = 100;
//    view_3_1_leftTop.testlabelText = @"3_1_leftTop";
//    view_3_1_leftTop.pendantViewID = 331;
//
//    WDBaseView *view_3_2_leftTop = [[WDBaseView alloc] init];
//    view_3_2_leftTop.backgroundColor = [UIColor yellowColor];
//    view_3_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_3_2_leftTop.levelWeight = 6;
//    view_3_2_leftTop.verticalWeight = 3;
//    view_3_2_leftTop.levelMager = 10;
//    view_3_2_leftTop.verticalMager = 10;
//    view_3_2_leftTop.width = 80;
//    view_3_2_leftTop.height = 40;
//    view_3_2_leftTop.testlabelText = @"3_2_leftTop";
//    view_3_2_leftTop.pendantViewID = 332;
//
//
//
//    WDBaseView *view_4_1_leftTop = [[WDBaseView alloc] init];
//    view_4_1_leftTop.backgroundColor = [UIColor redColor];
//    view_4_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//    view_4_1_leftTop.levelWeight = 3;
//    view_4_1_leftTop.verticalWeight = 4;
//    view_4_1_leftTop.levelMager = 10;
//    view_4_1_leftTop.verticalMager = 10;
//    view_4_1_leftTop.width = 200;
//    view_4_1_leftTop.height = 100;
//    view_4_1_leftTop.testlabelText = @"4_1_leftTop";
//    view_4_1_leftTop.pendantViewID = 341;
//
//
//    NSMutableArray *m_array = [NSMutableArray array];
//    [m_array addObject:view_1_1_rightTop];
//    [m_array addObject:view_1_3_rightTop];
//    [m_array addObject:view_1_2_rightTop];
//
//    [m_array addObject:view_1_2_rightBottom];
//    [m_array addObject:view_1_1_rightBottom];
//    [m_array addObject:view_1_3_rightBottom];
//
//    [m_array addObject:view_1_1_leftTop];
//    [m_array addObject:view_1_3_leftTop];
//    [m_array addObject:view_1_2_leftTop];
//    [m_array addObject:view_2_2_leftTop];
//    [m_array addObject:view_2_1_leftTop];
//    [m_array addObject:view_3_2_leftTop];
//    [m_array addObject:view_4_1_leftTop];
//    [m_array addObject:view_3_1_leftTop];
//
//    [self.groupView addPendantViewArray:m_array];
//
//}

- (WDPendantManager *)pendantManager {
    if (!_pendantManager) {
        _pendantManager = [[WDPendantManager alloc] init];
    }
    return _pendantManager;
}

@end



