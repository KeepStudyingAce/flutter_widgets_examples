//
//  TencentCameraPusherRegister.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/15.
//

#import "TencentCameraPusherRegister.h"
@implementation TencentCameraPusherRegister

+(void)registerWithRegistry:(NSObject<FlutterPluginRegistry> *)registry{
    //注册插件
    [TencentCameraPusherPlugin registerWithRegistrar:[registry registrarForPlugin:@"TencentCameraPusherPlugin"]];
}

@end

