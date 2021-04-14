//
//  TencentLivePlayerRegister.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/12.
//

#import "TencentLivePlayerRegister.h"
@implementation TencentLivePlayerRegister

+(void)registerWithRegistry:(NSObject<FlutterPluginRegistry> *)registry{
    //注册插件
    [TencentLivePlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"TencentLivePlayerPlugin"]];
}

@end
