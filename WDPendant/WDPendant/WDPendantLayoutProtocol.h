//
//  WDPendantLayoutProtocol.h
//  WDPendant
//
//  Created by yixiajwd on 2020/4/20.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,WDBaseViewBenchmarkType) {
    WDBaseViewBenchmarkTypeLeftTop = 1, // 左上
    WDBaseViewBenchmarkTypeLeftBottom = 2, // 左下
    WDBaseViewBenchmarkTypeRightTop = 3, // 右上
    WDBaseViewBenchmarkTypeRightBottom = 4, // 右下
};

@protocol WDPendantLayoutProtocol <NSObject>



@end
