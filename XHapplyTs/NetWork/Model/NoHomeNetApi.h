//
//  NoHomeNetApi.h
//  NoAssistantPj
//
//  Created by wt on 2018/11/27.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NoParmerScModel;

NS_ASSUME_NONNULL_BEGIN

@interface NoHomeNetApi : NSObject

/**
 数据请求

 @return <#return value description#>
 */
+(NoHomeNetApi *)sharedNoHomeNetApi;

/**
 登录

 @param mobile <#account description#>
 @param pwd <#pwd description#>
 @param succeed <#succeed description#>
 @param failure <#failure description#>
 */
-(void)g8NoLoginAccount:(NSString *)mobile
                    pwd:(NSString *)pwd
                succeed:(QQJXNetworkSuccess)succeed
                failure:(QQJXCommonFailBlock)failure;

/**
 获取验证码

 @param moblie <#moblie description#>
 @param type <#type description#>
 @param succeed <#succeed description#>
 @param failure <#failure description#>
 */
-(void)g8NoSendverify:(NSString *)moblie
                 type:(NoCodeTy)type
              succeed:(QQJXNetworkSuccess)succeed
              failure:(QQJXCommonFailBlock)failure;

/**
 注册

 @param mobile <#mobile description#>
 @param pwd <#pwd description#>
 @param verify <#verify description#>
 @param succeed <#succeed description#>
 @param failure <#failure description#>
 */
-(void)g8NoRegistAccount:(NSString *)mobile
                     pwd:(NSString *)pwd
                  verify:(NSString *)verify
                succeed:(QQJXNetworkSuccess)succeed
                failure:(QQJXCommonFailBlock)failure;














/**
 总网络

 @param alertY <#alertY description#>
 @param parM <#parM description#>
 @param succeed <#succeed description#>
 @param failure <#failure description#>
 */
-(void)g8NoRequestAlertY:(BOOL)alertY
              parameters:(NoParmerScModel *)parM
                    mapS:(NSString *)mapS
                 succeed:(QQJXNetworkSuccess)succeed
                 failure:(QQJXCommonFailBlock)failure;

@end

NS_ASSUME_NONNULL_END
