//
//  WDHomePendantView.h
//  WDPendant
//
//  Created by yixiajwd on 2020/4/21.
//  Copyright © 2020 yixiajwd. All rights reserved.
//

#import "WDBaseView.h"
#import "WDPendantLayoutProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface WDHomePendantView : WDBaseView<WDPendantLayoutProtocol>

@property (nonatomic, assign) CGFloat         homeWidth; ///< <#value#>
@property (nonatomic, assign) CGFloat         homeHeight; ///< <#value#>


@end

NS_ASSUME_NONNULL_END
