//
//  NoBaseC.h
//  NoAssistantPj
//
//  Created by wt on 2018/11/26.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoBaseC : UIViewController

/**
 导航栏文字

 @param naviTitle <#naviTitle description#>
 */
-(void)QQJXNaviTitle:(NSString *)naviTitle;

/**
 返回按钮

 @param isRoot <#isRoot description#>
 */
-(void)QQBackBut:(BOOL)isRoot;

/**
 适配iPhone X以上的底部白横

 @return <#return value description#>
 */
-(CGFloat)g9BomXs;


@end


NS_ASSUME_NONNULL_END
