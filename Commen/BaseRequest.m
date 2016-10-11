//
//  BaseRequest.m
//  LWZhangChu
//
//  Created by qianfeng on 16/10/11.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

#import "BaseRequest.h"



@implementation BaseRequest

+(void)postWithURL:(NSString *)url para:(NSDictionary *)para callBack:(void (^)(NSData *, NSError *))callBack {
    //拼接url的IP地址，资源路径、资源参数
    NSMutableString *urlStr = [[NSMutableString alloc]initWithString:url];
    
    [urlStr appendString: [self paraToString:para]];
    
    NSURL *URL = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    
    //当请求的资源参数数据过大，不能放在资源参数部分时，或者为了不暴露接口的API将相关的请求参数放到请求体中。
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:para options:NSJSONWritingPrettyPrinted error:nil];          //返回值为NSData
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //请求响应的回调 block
        if (!error) {
            callBack(data,error);
//            NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
    
    [task resume];
}


+(void)getWithURL:(NSString *)url para:(NSDictionary *)para callBack:(void (^)(NSData *, NSError *))callBack {
    //拼接url的IP地址，资源路径、资源参数
    NSMutableString *urlStr = [[NSMutableString alloc]initWithString:url];
    
    [urlStr appendString: [self paraToString:para]];
    
    NSURL *URL = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"GET";
    
    //当请求的资源参数数据过大，不能放在资源参数部分时，或者为了不暴露接口的API将相关的请求参数放到请求体中。
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:para options:NSJSONWritingPrettyPrinted error:nil];          //返回值为NSData
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //请求响应的回调 block
        if (!error) {
            callBack(data,error);
//            NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
    
    [task resume];
}


//将para字典拼接为资源参数部分
+(NSString *)paraToString: (NSDictionary *)para {
    NSMutableString *str = [NSMutableString stringWithString:@"?"];
    
    for (NSString *key in para.allKeys) {
        [str appendFormat:@"%@=%@&",key,para[key]];
    }
    if ([str hasSuffix:@"&"]){
        //删除多余的& 连接符
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
    
    //如果资源中含有中文或其他等特殊字符时进行Unicode编码
    NSString *paraStr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    return paraStr;
}

@end
