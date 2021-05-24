//
//  TencentScreenPusherPlugin.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/5/19.
//


#import <Foundation/Foundation.h>
#import "TencentScreenPusherPlugin.h"
#import "TencentScreenPusherFactory.h"


@implementation TencentScreenPusherPlugin

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    
    //注册插件
    //注册 FlutterIosTextLabelFactory
    //com.flutter_to_native_test_textview 为flutter 调用此  view 的标识
    [registrar registerViewFactory:[[TencentScreenPusherFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.tencent.live.screen_push"];
}

@end
