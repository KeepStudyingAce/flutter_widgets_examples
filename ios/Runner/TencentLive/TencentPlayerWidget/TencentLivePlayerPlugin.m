//
//  TencentLivePlayerPlugin.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/12.
//

#import <Foundation/Foundation.h>
#import "TencentLivePlayerPlugin.h"
#import "TencentLivePlayerFactory.h"


@implementation TencentLivePlayerPlugin

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    
    //注册插件
    //注册 FlutterIosTextLabelFactory
    //com.flutter_to_native_test_textview 为flutter 调用此  textLabel 的标识
    [registrar registerViewFactory:[[TencentLivePlayerFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.tencent.live.player"];
}

@end

