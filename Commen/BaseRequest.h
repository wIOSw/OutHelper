//
//  BaseRequest.h
//  LWZhangChu
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

#import <Foundation/Foundation.h>

//网络请求的基类
// POST 、 GET 、 DELETE、PUT、HEADER、TRACE、 OPTION


@interface BaseRequest : NSObject
//POST请求方法

+(void)postWithURL:(NSString *)url para:(NSDictionary *)para callBack: (void (^)(NSData* data, NSError* error))callBack;

// 提示名: (参数类型)参数名
+(void)getWithURL: (NSString *)url para:(NSDictionary *)para callBack: (void (^)(NSData* data, NSError* error))callBack;

//DELETE 类似于GET     PUT类似于POST

@end
