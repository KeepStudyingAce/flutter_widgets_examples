//
//  FlutterIosTextLabelRegister.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/8.
//

#import "FlutterIosTextLabelRegister.h"

@implementation FlutterIosTextLabelRegister

+(void)registerWithRegistry:(NSObject<FlutterPluginRegistry> *)registry{
    //注册插件
    [FlutterIosTextLabelPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterIosTextLabelPlugin"]];
}

@end
