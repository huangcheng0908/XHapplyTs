//
//  NoNetWorkApi.m
//  NoAssistantPj
//
//  Created by wt on 2018/11/26.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import "NoNetWorkApi.h"

@implementation NoNetWorkApi

+(NoNetWorkApi *)sharedNoNetWorkApi
{
    static NoNetWorkApi * network = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (network == nil)
        {
            network = [NoNetWorkApi new];
        }
    });
    return network;
}

-(void)NoRequestAFURL:(NSString *)URLString
           httpMethod:(NoHttpMethod)method
               alertY:(BOOL)alertY
           parameters:(NSDictionary *)parameters
              succeed:(QQJXNetworkSuccess)succeed
              failure:(QQJXCommonFailBlock)failure
{
    if (alertY)
    {
        [SVProgressHUD show];
    }
    [SVProgressHUD setMinimumDismissTimeInterval:3.0f];
    [SVProgressHUD setBackgroundColor:JXFHexRGBAlpha(0xf1f1f1, 1.0f)];
    [SVProgressHUD setForegroundColor:NoMainColor];
    DefineWeakSelf;
    URLString = [NSString stringWithFormat:@"%@%@",BASE_URL,[URLString stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
    CXTLog(@"链接 = %@ \n 参数 = %@",URLString,parameters);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/json",
                                                         @"text/javascript",
                                                         @"text/html",
                                                         @"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 30;
    switch (method)
    {
        case NoGETMethod:
        {
            [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress)
            {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                [weakSelf successResponse:responseObject callback:succeed];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                [SVProgressHUD dismiss];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD showErrorWithStatus:error.userInfo[@"NSLocalizedDescription"]];
                });
            }];
        }
        break;
            
        case NoPOSTMethod:
        {
            [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress)
            {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                CXTLog(@"黄城 = %@",responseObject);
                [weakSelf successResponse:responseObject callback:succeed];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                [SVProgressHUD dismiss];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD showErrorWithStatus:error.userInfo[@"NSLocalizedDescription"]];
                });
            }];
        }
        break;
            
        default:
            break;
    }
}

- (void)successResponse:(id)responseData
               callback:(QQJXNetworkSuccess)success
{
    success([self tryToParseData:responseData]);
}

/**
 解析json数据
 
 @param json <#json description#>
 @return <#return value description#>
 */
- (id)tryToParseData:(id)json
{
    if (!json || json == (id)kCFNull) return nil;
    id dic = nil;
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSString class]])
    {
        jsonData = [(NSString *)json dataUsingEncoding : NSUTF8StringEncoding];
    } else if ([json isKindOfClass:[NSData class]])
    {
        jsonData = json;
    }else
    {
        dic = json;
    }
    if (jsonData)
    {
        NSError * error = nil;
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    }
    [SVProgressHUD dismiss];
    CXTLog(@"json = %@",dic);
    NoParmerScModel * parM = [NoParmerScModel mj_objectWithKeyValues:dic];
    if (parM.status.integerValue == 200)
    {
        return parM;
    }else
    {
        [SVProgressHUD showErrorWithStatus:parM.message];
    }
    return nil;
}








@end
