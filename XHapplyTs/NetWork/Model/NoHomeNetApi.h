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

 @param account <#account description#>
 @param pwd <#pwd description#>
 @param succeed <#succeed description#>
 @param failure <#failure description#>
 */
-(void)g8NoLoginAccount:(NSString *)account
                    pwd:(NSString *)pwd
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
