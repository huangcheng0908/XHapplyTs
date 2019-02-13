//
//  NoLocalApi.m
//  NoAssistantPj
//
//  Created by wt on 2018/11/27.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import "NoLocalApi.h"

@implementation NoLocalApi

+(NoLocalApi *)sharedNoLocalApi
{
    static NoLocalApi * publicApi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (publicApi == nil)
        {
            publicApi = [[NoLocalApi alloc]init];
        }
    });
    return publicApi;
}





@end
