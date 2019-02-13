//
//  NoParmerModel.h
//  NoAssistantPj
//
//  Created by wt on 2018/11/27.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoParmerScModel : NSObject

/**
 账号
 */
@property (retain,nonatomic)NSString * userAccount;

/**
 密码
 */
@property (retain,nonatomic)NSString * password;


@property (retain,nonatomic)NSString * msgCode;

@property (retain,nonatomic)NSString * msgText;







@end

NS_ASSUME_NONNULL_END
