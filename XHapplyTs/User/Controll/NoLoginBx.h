//
//  NoLoginBx.h
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoBaseC.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoLoginBx : NoBaseC

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *g8BomHc;
@property (weak, nonatomic) IBOutlet UIScrollView *g8ScrollBc;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *g8TopBs;

/**
 登录注册

 @return <#return value description#>
 */
+(NoLoginBx *)shareNoLoginBx;


@end

NS_ASSUME_NONNULL_END
