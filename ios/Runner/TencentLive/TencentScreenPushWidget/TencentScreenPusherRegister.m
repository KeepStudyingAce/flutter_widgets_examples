//
//  TencentScreenPusherRegister.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/5/19.
//

#import "TencentScreenPusherRegister.h"
@implementation TencentScreenPusherRegister

+(void)registerWithRegistry:(NSObject<FlutterPluginRegistry> *)registry{
    //注册插件
    [TencentScreenPusherPlugin registerWithRegistrar:[registry registrarForPlugin:@"TencentScreenPusherPlugin"]];
}

@end
