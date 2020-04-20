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

@interface ViewController ()

@property (nonatomic, strong) WDGroupView        *groupView; ///< <#value#>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.groupView = [[WDGroupView alloc] init];
    self.groupView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.groupView];

    [self.groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-100);
    }];

    [self leftTop];

    [self rightBottom];

//    [self rightTop];


}

- (void)rightTop {

    WDBaseView *view_1_1 = [[WDBaseView alloc] init];
    view_1_1.backgroundColor = [UIColor redColor];
    view_1_1.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
    view_1_1.levelWeight = 1;
    view_1_1.verticalWeight = 1;
    view_1_1.levelMager = 10;
    view_1_1.verticalMager = 10;
    view_1_1.width = 100;
    view_1_1.height = 30;


    WDBaseView *view_1_2 = [[WDBaseView alloc] init];
    view_1_2.backgroundColor = [UIColor yellowColor];
    view_1_2.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
    view_1_2.levelWeight = 1;
    view_1_2.verticalWeight = 2;
    view_1_2.levelMager = 10;
    view_1_2.verticalMager = 10;
    view_1_2.width = 100;
    view_1_2.height = 100;

    WDBaseView *view_1_3 = [[WDBaseView alloc] init];
    view_1_3.backgroundColor = [UIColor greenColor];
    view_1_3.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
    view_1_3.levelWeight = 1;
    view_1_3.verticalWeight = 3;
    view_1_3.levelMager = 10;
    view_1_3.verticalMager = 10;
    view_1_3.width = 50;
    view_1_3.height = 50;

    NSMutableArray *m_array = [NSMutableArray array];
    [m_array addObject:view_1_1];
    [m_array addObject:view_1_3];
    [m_array addObject:view_1_2];

    [self.groupView addRightTopPendantView:m_array];

}

- (void)rightBottom {

    WDBaseView *view_1_1 = [[WDBaseView alloc] init];
       view_1_1.backgroundColor = [UIColor redColor];
       view_1_1.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
       view_1_1.levelWeight = 1;
       view_1_1.verticalWeight = 1;
       view_1_1.levelMager = 10;
       view_1_1.verticalMager = 10;
       view_1_1.width = 100;
       view_1_1.height = 100;


       WDBaseView *view_1_2 = [[WDBaseView alloc] init];
       view_1_2.backgroundColor = [UIColor yellowColor];
       view_1_2.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
       view_1_2.levelWeight = 1;
       view_1_2.verticalWeight = 2;
       view_1_2.levelMager = 10;
       view_1_2.verticalMager = 10;
       view_1_2.width = 80;
       view_1_2.height = 80;

       WDBaseView *view_1_3 = [[WDBaseView alloc] init];
       view_1_3.backgroundColor = [UIColor greenColor];
       view_1_3.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
       view_1_3.levelWeight = 1;
       view_1_3.verticalWeight = 3;
       view_1_3.levelMager = 10;
       view_1_3.verticalMager = 10;
       view_1_3.width = 50;
       view_1_3.height = 50;

       NSMutableArray *m_array = [NSMutableArray array];
    [m_array addObject:view_1_2];
       [m_array addObject:view_1_1];
       [m_array addObject:view_1_3];

       [self.groupView addRightBottomPendantView:m_array];

}



- (void)leftTop {

    NSMutableArray *m_set = [NSMutableArray array];

       WDBaseView *view_1_1 = [[WDBaseView alloc] init];
       view_1_1.backgroundColor = [UIColor redColor];
       view_1_1.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_1_1.levelWeight = 1;
       view_1_1.verticalWeight = 1;
       view_1_1.levelMager = 10;
       view_1_1.verticalMager = 10;
       view_1_1.width = 100;
       view_1_1.height = 20;


       WDBaseView *view_1_2 = [[WDBaseView alloc] init];
       view_1_2.backgroundColor = [UIColor yellowColor];
       view_1_2.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_1_2.levelWeight = 2;
       view_1_2.verticalWeight = 1;
       view_1_2.levelMager = 10;
       view_1_2.verticalMager = 10;
       view_1_2.width = 50;
       view_1_2.height = 20;

       WDBaseView *view_1_3 = [[WDBaseView alloc] init];
       view_1_3.backgroundColor = [UIColor greenColor];
       view_1_3.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_1_3.levelWeight = 3;
       view_1_3.verticalWeight = 1;
       view_1_3.levelMager = 10;
       view_1_3.verticalMager = 10;
       view_1_3.width = 50;
       view_1_3.height = 20;


       WDBaseView *view_2_1 = [[WDBaseView alloc] init];
       view_2_1.backgroundColor = [UIColor greenColor];
       view_2_1.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_2_1.levelWeight = 1;
       view_2_1.verticalWeight = 2;
       view_2_1.levelMager = 10;
       view_2_1.verticalMager = 10;
       view_2_1.width = 50;
       view_2_1.height = 20;


       WDBaseView *view_2_2 = [[WDBaseView alloc] init];
       view_2_2.backgroundColor = [UIColor redColor];
       view_2_2.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_2_2.levelWeight = 2;
       view_2_2.verticalWeight = 2;
       view_2_2.levelMager = 10;
       view_2_2.verticalMager = 10;
       view_2_2.width = 100;
       view_2_2.height = 20;


       WDBaseView *view_3_1 = [[WDBaseView alloc] init];
       view_3_1.backgroundColor = [UIColor yellowColor];
       view_3_1.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_3_1.levelWeight = 1;
       view_3_1.verticalWeight = 3;
       view_3_1.levelMager = 10;
       view_3_1.verticalMager = 10;
       view_3_1.width = 100;
       view_3_1.height = 100;

       WDBaseView *view_3_2 = [[WDBaseView alloc] init];
       view_3_2.backgroundColor = [UIColor yellowColor];
       view_3_2.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_3_2.levelWeight = 2;
       view_3_2.verticalWeight = 3;
       view_3_2.levelMager = 10;
       view_3_2.verticalMager = 10;
       view_3_2.width = 80;
       view_3_2.height = 40;



       WDBaseView *view_4_1 = [[WDBaseView alloc] init];
       view_4_1.backgroundColor = [UIColor redColor];
       view_4_1.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
       view_4_1.levelWeight = 1;
       view_4_1.verticalWeight = 4;
       view_4_1.levelMager = 10;
       view_4_1.verticalMager = 10;
       view_4_1.width = 200;
       view_4_1.height = 100;


       [m_set addObject:view_1_1];
    [m_set addObject:view_1_3];
       [m_set addObject:view_1_2];
    [m_set addObject:view_2_2];
       [m_set addObject:view_2_1];
    [m_set addObject:view_3_2];
    [m_set addObject:view_4_1];
       [m_set addObject:view_3_1];




       [self.groupView addLeftTopPendantView:m_set];

}


@end



