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

@property (nonatomic, strong) UIView        *oneView; ///< <#value#>
@property (nonatomic, strong) UIView        *twoView; ///< <#value#>
@property (nonatomic, strong) UIView        *threeView; ///< <#value#>


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
    [_updateBtn addTarget:self action:@selector(_moveBtnDid) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_updateBtn];
    [_updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addBtn);
        make.bottom.equalTo(addBtn.mas_top).offset(-2);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];



    UIView *oneView =  [[UIView alloc] init];
    self.oneView = oneView;
    [self.view addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-100);
    }];

    UIView *twoView =  [[UIView alloc] init];
    self.twoView = twoView;
    [self.view addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-100);
    }];


    UIView *threeView =  [[UIView alloc] init];
    self.threeView = threeView;
    [self.view addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-100);
    }];


    WDHomePendantView *homeView = [[WDHomePendantView alloc] init];
    homeView.pendantSuperView = oneView;
    homeView.testlabelText = @"homeView";
    self.homeView = homeView;
    [oneView addSubview:homeView];

    [self.pendantManager addPendantView:homeView];


    WDMyPendantView *myView = [[WDMyPendantView alloc] init];
    myView.testlabelText = @"myView";
    myView.pendantSuperView = twoView;
    [twoView addSubview:myView];
    [self.pendantManager addPendantView:myView];


    WDMsgPendantView *msgView = [[WDMsgPendantView alloc] init];
    msgView.testlabelText = @"msgView";
    msgView.pendantSuperView = threeView;
    [threeView addSubview:msgView];
    [self.pendantManager addPendantView:msgView];

}

- (void)addBtnDid {

    WDNearPendantView *nearView = [[WDNearPendantView alloc] init];
    [self.threeView addSubview:nearView];

    nearView.testlabelText = @"nearView";
    nearView.pendantSuperView = self.threeView;
    nearView.pendantBenchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    [self.pendantManager addPendantView:nearView];
}

- (void)_moveBtnDid {
    
    [self.pendantManager movePendantView:self.homeView formBenchmarkType:WDBaseViewBenchmarkTypeLeftTop toBenchmarkType:WDBaseViewBenchmarkTypeRightTop];
}

- (void)updateBtnDid {

    self.homeView.pendantHeight = 100;
    self.homeView.pendantWidth = 100;
    [self.pendantManager updatePendantView:self.homeView];
}

- (void)removeBtnDid {
    [self.pendantManager removePendantView:self.homeView];

}

- (WDPendantManager *)pendantManager {
    if (!_pendantManager) {
        _pendantManager = [[WDPendantManager alloc] init];
    }
    return _pendantManager;
}

@end



