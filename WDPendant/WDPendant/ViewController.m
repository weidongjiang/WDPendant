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

//    [self leftTop];
//
//    [self rightBottom];
//
//    [self rightTop];

    [self allview];

}


- (void)allview {

    WDBaseView *view_1_1_rightTop = [[WDBaseView alloc] init];
    view_1_1_rightTop.backgroundColor = [UIColor redColor];
    view_1_1_rightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
    view_1_1_rightTop.levelWeight = 1;
    view_1_1_rightTop.verticalWeight = 1;
    view_1_1_rightTop.levelMager = 10;
    view_1_1_rightTop.verticalMager = 10;
    view_1_1_rightTop.width = 100;
    view_1_1_rightTop.height = 30;
    view_1_1_rightTop.testlabelText = @"1_1_rightTop";

    WDBaseView *view_1_2_rightTop = [[WDBaseView alloc] init];
    view_1_2_rightTop.backgroundColor = [UIColor yellowColor];
    view_1_2_rightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
    view_1_2_rightTop.levelWeight = 1;
    view_1_2_rightTop.verticalWeight = 2;
    view_1_2_rightTop.levelMager = 10;
    view_1_2_rightTop.verticalMager = 10;
    view_1_2_rightTop.width = 100;
    view_1_2_rightTop.height = 100;
    view_1_2_rightTop.testlabelText = @"1_2_rightTop";

    WDBaseView *view_1_3_rightTop = [[WDBaseView alloc] init];
    view_1_3_rightTop.backgroundColor = [UIColor greenColor];
    view_1_3_rightTop.benchmarkType = WDBaseViewBenchmarkTypeRightTop;
    view_1_3_rightTop.levelWeight = 1;
    view_1_3_rightTop.verticalWeight = 3;
    view_1_3_rightTop.levelMager = 10;
    view_1_3_rightTop.verticalMager = 10;
    view_1_3_rightTop.width = 50;
    view_1_3_rightTop.height = 50;
    view_1_3_rightTop.testlabelText = @"1_3_rightTop";



    WDBaseView *view_1_1_rightBottom = [[WDBaseView alloc] init];
    view_1_1_rightBottom.backgroundColor = [UIColor redColor];
    view_1_1_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
    view_1_1_rightBottom.levelWeight = 1;
    view_1_1_rightBottom.verticalWeight = 1;
    view_1_1_rightBottom.levelMager = 10;
    view_1_1_rightBottom.verticalMager = 10;
    view_1_1_rightBottom.width = 100;
    view_1_1_rightBottom.height = 100;
    view_1_1_rightBottom.testlabelText = @"1_1_rightBottom";


    WDBaseView *view_1_2_rightBottom = [[WDBaseView alloc] init];
    view_1_2_rightBottom.backgroundColor = [UIColor yellowColor];
    view_1_2_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
    view_1_2_rightBottom.levelWeight = 1;
    view_1_2_rightBottom.verticalWeight = 2;
    view_1_2_rightBottom.levelMager = 10;
    view_1_2_rightBottom.verticalMager = 10;
    view_1_2_rightBottom.width = 80;
    view_1_2_rightBottom.height = 80;
    view_1_2_rightBottom.testlabelText = @"1_2_rightBottom";

    WDBaseView *view_1_3_rightBottom = [[WDBaseView alloc] init];
    view_1_3_rightBottom.backgroundColor = [UIColor greenColor];
    view_1_3_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
    view_1_3_rightBottom.levelWeight = 1;
    view_1_3_rightBottom.verticalWeight = 3;
    view_1_3_rightBottom.levelMager = 10;
    view_1_3_rightBottom.verticalMager = 10;
    view_1_3_rightBottom.width = 50;
    view_1_3_rightBottom.height = 50;
    view_1_3_rightBottom.testlabelText = @"1_3_rightBottom";




    WDBaseView *view_1_1_leftTop = [[WDBaseView alloc] init];
    view_1_1_leftTop.backgroundColor = [UIColor redColor];
    view_1_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_1_1_leftTop.levelWeight = 1;
    view_1_1_leftTop.verticalWeight = 1;
    view_1_1_leftTop.levelMager = 10;
    view_1_1_leftTop.verticalMager = 10;
    view_1_1_leftTop.width = 100;
    view_1_1_leftTop.height = 20;
    view_1_1_leftTop.testlabelText = @"1_1_leftTop";

    WDBaseView *view_1_2_leftTop = [[WDBaseView alloc] init];
    view_1_2_leftTop.backgroundColor = [UIColor yellowColor];
    view_1_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_1_2_leftTop.levelWeight = 2;
    view_1_2_leftTop.verticalWeight = 1;
    view_1_2_leftTop.levelMager = 10;
    view_1_2_leftTop.verticalMager = 10;
    view_1_2_leftTop.width = 50;
    view_1_2_leftTop.height = 20;
    view_1_2_leftTop.testlabelText = @"1_2_leftTop";

    WDBaseView *view_1_3_leftTop = [[WDBaseView alloc] init];
    view_1_3_leftTop.backgroundColor = [UIColor greenColor];
    view_1_3_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_1_3_leftTop.levelWeight = 3;
    view_1_3_leftTop.verticalWeight = 1;
    view_1_3_leftTop.levelMager = 10;
    view_1_3_leftTop.verticalMager = 10;
    view_1_3_leftTop.width = 50;
    view_1_3_leftTop.height = 20;
    view_1_3_leftTop.testlabelText = @"1_3_leftTop";


    WDBaseView *view_2_1_leftTop = [[WDBaseView alloc] init];
    view_2_1_leftTop.backgroundColor = [UIColor greenColor];
    view_2_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_2_1_leftTop.levelWeight = 1;
    view_2_1_leftTop.verticalWeight = 2;
    view_2_1_leftTop.levelMager = 10;
    view_2_1_leftTop.verticalMager = 10;
    view_2_1_leftTop.width = 50;
    view_2_1_leftTop.height = 20;
    view_2_1_leftTop.testlabelText = @"2_1_leftTop";


    WDBaseView *view_2_2_leftTop = [[WDBaseView alloc] init];
    view_2_2_leftTop.backgroundColor = [UIColor redColor];
    view_2_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_2_2_leftTop.levelWeight = 2;
    view_2_2_leftTop.verticalWeight = 2;
    view_2_2_leftTop.levelMager = 10;
    view_2_2_leftTop.verticalMager = 10;
    view_2_2_leftTop.width = 100;
    view_2_2_leftTop.height = 20;
    view_2_2_leftTop.testlabelText = @"2_2_leftTop";


    WDBaseView *view_3_1_leftTop = [[WDBaseView alloc] init];
    view_3_1_leftTop.backgroundColor = [UIColor yellowColor];
    view_3_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_3_1_leftTop.levelWeight = 1;
    view_3_1_leftTop.verticalWeight = 3;
    view_3_1_leftTop.levelMager = 10;
    view_3_1_leftTop.verticalMager = 10;
    view_3_1_leftTop.width = 100;
    view_3_1_leftTop.height = 100;
    view_3_1_leftTop.testlabelText = @"3_1_leftTop";

    WDBaseView *view_3_2_leftTop = [[WDBaseView alloc] init];
    view_3_2_leftTop.backgroundColor = [UIColor yellowColor];
    view_3_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_3_2_leftTop.levelWeight = 2;
    view_3_2_leftTop.verticalWeight = 3;
    view_3_2_leftTop.levelMager = 10;
    view_3_2_leftTop.verticalMager = 10;
    view_3_2_leftTop.width = 80;
    view_3_2_leftTop.height = 40;
    view_3_2_leftTop.testlabelText = @"3_2_leftTop";



    WDBaseView *view_4_1_leftTop = [[WDBaseView alloc] init];
    view_4_1_leftTop.backgroundColor = [UIColor redColor];
    view_4_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
    view_4_1_leftTop.levelWeight = 1;
    view_4_1_leftTop.verticalWeight = 4;
    view_4_1_leftTop.levelMager = 10;
    view_4_1_leftTop.verticalMager = 10;
    view_4_1_leftTop.width = 200;
    view_4_1_leftTop.height = 100;
    view_4_1_leftTop.testlabelText = @"4_1_leftTop";


    NSMutableArray *m_array = [NSMutableArray array];
    [m_array addObject:view_1_1_rightTop];
    [m_array addObject:view_1_3_rightTop];
    [m_array addObject:view_1_2_rightTop];

    [m_array addObject:view_1_2_rightBottom];
    [m_array addObject:view_1_1_rightBottom];
    [m_array addObject:view_1_3_rightBottom];

    [m_array addObject:view_1_1_leftTop];
    [m_array addObject:view_1_3_leftTop];
    [m_array addObject:view_1_2_leftTop];
    [m_array addObject:view_2_2_leftTop];
    [m_array addObject:view_2_1_leftTop];
    [m_array addObject:view_3_2_leftTop];
    [m_array addObject:view_4_1_leftTop];
    [m_array addObject:view_3_1_leftTop];

    [self.groupView addPendantViewArray:m_array];

}







//
//- (void)rightTop {
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
//
//    NSMutableArray *m_array = [NSMutableArray array];
//    [m_array addObject:view_1_1_rightTop];
//    [m_array addObject:view_1_3_rightTop];
//    [m_array addObject:view_1_2_rightTop];
//
////    [self.groupView addRightTopPendantView:m_array];
//    [self.groupView addPendantViewArray:m_array];
//
//}
//
//- (void)rightBottom {
//
//    WDBaseView *view_1_1_rightBottom = [[WDBaseView alloc] init];
//       view_1_1_rightBottom.backgroundColor = [UIColor redColor];
//       view_1_1_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//       view_1_1_rightBottom.levelWeight = 1;
//       view_1_1_rightBottom.verticalWeight = 1;
//       view_1_1_rightBottom.levelMager = 10;
//       view_1_1_rightBottom.verticalMager = 10;
//       view_1_1_rightBottom.width = 100;
//       view_1_1_rightBottom.height = 100;
//
//
//       WDBaseView *view_1_2_rightBottom = [[WDBaseView alloc] init];
//       view_1_2_rightBottom.backgroundColor = [UIColor yellowColor];
//       view_1_2_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//       view_1_2_rightBottom.levelWeight = 1;
//       view_1_2_rightBottom.verticalWeight = 2;
//       view_1_2_rightBottom.levelMager = 10;
//       view_1_2_rightBottom.verticalMager = 10;
//       view_1_2_rightBottom.width = 80;
//       view_1_2_rightBottom.height = 80;
//
//       WDBaseView *view_1_3_rightBottom = [[WDBaseView alloc] init];
//       view_1_3_rightBottom.backgroundColor = [UIColor greenColor];
//       view_1_3_rightBottom.benchmarkType = WDBaseViewBenchmarkTypeRightBottom;
//       view_1_3_rightBottom.levelWeight = 1;
//       view_1_3_rightBottom.verticalWeight = 3;
//       view_1_3_rightBottom.levelMager = 10;
//       view_1_3_rightBottom.verticalMager = 10;
//       view_1_3_rightBottom.width = 50;
//       view_1_3_rightBottom.height = 50;
//
//       NSMutableArray *m_array = [NSMutableArray array];
//    [m_array addObject:view_1_2_rightBottom];
//       [m_array addObject:view_1_1_rightBottom];
//       [m_array addObject:view_1_3_rightBottom];
//
////       [self.groupView addRightBottomPendantView:m_array];
//    [self.groupView addPendantViewArray:m_array];
//
//}
//
//
//
//- (void)leftTop {
//
//    NSMutableArray *m_set = [NSMutableArray array];
//
//       WDBaseView *view_1_1_leftTop = [[WDBaseView alloc] init];
//       view_1_1_leftTop.backgroundColor = [UIColor redColor];
//       view_1_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_1_1_leftTop.levelWeight = 1;
//       view_1_1_leftTop.verticalWeight = 1;
//       view_1_1_leftTop.levelMager = 10;
//       view_1_1_leftTop.verticalMager = 10;
//       view_1_1_leftTop.width = 100;
//       view_1_1_leftTop.height = 20;
//
//
//       WDBaseView *view_1_2_leftTop = [[WDBaseView alloc] init];
//       view_1_2_leftTop.backgroundColor = [UIColor yellowColor];
//       view_1_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_1_2_leftTop.levelWeight = 2;
//       view_1_2_leftTop.verticalWeight = 1;
//       view_1_2_leftTop.levelMager = 10;
//       view_1_2_leftTop.verticalMager = 10;
//       view_1_2_leftTop.width = 50;
//       view_1_2_leftTop.height = 20;
//
//       WDBaseView *view_1_3_leftTop = [[WDBaseView alloc] init];
//       view_1_3_leftTop.backgroundColor = [UIColor greenColor];
//       view_1_3_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_1_3_leftTop.levelWeight = 3;
//       view_1_3_leftTop.verticalWeight = 1;
//       view_1_3_leftTop.levelMager = 10;
//       view_1_3_leftTop.verticalMager = 10;
//       view_1_3_leftTop.width = 50;
//       view_1_3_leftTop.height = 20;
//
//
//       WDBaseView *view_2_1_leftTop = [[WDBaseView alloc] init];
//       view_2_1_leftTop.backgroundColor = [UIColor greenColor];
//       view_2_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_2_1_leftTop.levelWeight = 1;
//       view_2_1_leftTop.verticalWeight = 2;
//       view_2_1_leftTop.levelMager = 10;
//       view_2_1_leftTop.verticalMager = 10;
//       view_2_1_leftTop.width = 50;
//       view_2_1_leftTop.height = 20;
//
//
//       WDBaseView *view_2_2_leftTop = [[WDBaseView alloc] init];
//       view_2_2_leftTop.backgroundColor = [UIColor redColor];
//       view_2_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_2_2_leftTop.levelWeight = 2;
//       view_2_2_leftTop.verticalWeight = 2;
//       view_2_2_leftTop.levelMager = 10;
//       view_2_2_leftTop.verticalMager = 10;
//       view_2_2_leftTop.width = 100;
//       view_2_2_leftTop.height = 20;
//
//
//       WDBaseView *view_3_1_leftTop = [[WDBaseView alloc] init];
//       view_3_1_leftTop.backgroundColor = [UIColor yellowColor];
//       view_3_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_3_1_leftTop.levelWeight = 1;
//       view_3_1_leftTop.verticalWeight = 3;
//       view_3_1_leftTop.levelMager = 10;
//       view_3_1_leftTop.verticalMager = 10;
//       view_3_1_leftTop.width = 100;
//       view_3_1_leftTop.height = 100;
//
//       WDBaseView *view_3_2_leftTop = [[WDBaseView alloc] init];
//       view_3_2_leftTop.backgroundColor = [UIColor yellowColor];
//       view_3_2_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_3_2_leftTop.levelWeight = 2;
//       view_3_2_leftTop.verticalWeight = 3;
//       view_3_2_leftTop.levelMager = 10;
//       view_3_2_leftTop.verticalMager = 10;
//       view_3_2_leftTop.width = 80;
//       view_3_2_leftTop.height = 40;
//
//
//
//       WDBaseView *view_4_1_leftTop = [[WDBaseView alloc] init];
//       view_4_1_leftTop.backgroundColor = [UIColor redColor];
//       view_4_1_leftTop.benchmarkType = WDBaseViewBenchmarkTypeLeftTop;
//       view_4_1_leftTop.levelWeight = 1;
//       view_4_1_leftTop.verticalWeight = 4;
//       view_4_1_leftTop.levelMager = 10;
//       view_4_1_leftTop.verticalMager = 10;
//       view_4_1_leftTop.width = 200;
//       view_4_1_leftTop.height = 100;
//
//
//       [m_set addObject:view_1_1_leftTop];
//    [m_set addObject:view_1_3_leftTop];
//       [m_set addObject:view_1_2_leftTop];
//    [m_set addObject:view_2_2_leftTop];
//       [m_set addObject:view_2_1_leftTop];
//    [m_set addObject:view_3_2_leftTop];
//    [m_set addObject:view_4_1_leftTop];
//       [m_set addObject:view_3_1_leftTop];
//
//
//
//    [self.groupView addPendantViewArray:m_set];
//
////       [self.groupView addLeftTopPendantView:m_set];
//
//}


@end



