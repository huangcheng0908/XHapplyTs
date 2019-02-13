//
//  NoNetWorkApi.h
//  NoAssistantPj
//
//  Created by wt on 2018/11/26.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoNetBlock.h"
#import "NoParmerScModel.h"

NS_ASSUME_NONNULL_BEGIN

#define BASE_URL InterIP
#define InterZanIP @""

typedef NS_ENUM(NSInteger,NoHttpMethod)
{
    NoGETMethod = 1,
    NoPOSTMethod
};

@interface NoNetWorkApi : NSObject


/**
 网络单例

 @return <#return value description#>
 */
+(NoNetWorkApi *)sharedNoNetWorkApi;

/**
 网络请求

 @param URLString <#URLString description#>
 @param method <#method description#>
 @param alertY <#alertY description#>
 @param parameters <#parameters description#>
 @param succeed <#succeed description#>
 @param failure <#failure description#>
 */
-(void)NoRequestAFURL:(NSString *)URLString
             httpMethod:(NoHttpMethod)method
                 alertY:(BOOL)alertY
             parameters:(NSDictionary *)parameters
                succeed:(QQJXNetworkSuccess)succeed
                failure:(QQJXCommonFailBlock)failure;








@end

NS_ASSUME_NONNULL_END
