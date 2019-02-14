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
 手机号
 */
@property (retain,nonatomic)NSString * mobile;

/**
 密码
 */
@property (retain,nonatomic)NSString * password;

/**
 短信类型：0：通用模板；1：注册；2：短信登录
 */
@property (retain,nonatomic)NSString * type;

/**
 用户角色，1-会员，2-亲友团
 */
@property (retain,nonatomic)NSString * role;

/**
 确认密码
 */
@property (retain,nonatomic)NSString * repassword;

/**
 短信验证码
 */
@property (retain,nonatomic)NSString * verify;










/**
 返回码：200：成功；300：操作失败；
 */
@property (retain,nonatomic)NSString * status;

/**
 文字信息
 */
@property (retain,nonatomic)NSString * message;







@end

NS_ASSUME_NONNULL_END
