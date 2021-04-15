//
//  TencentCameraPusherPlugin.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/15.
//

#import <Foundation/Foundation.h>
#import "TencentCameraPusherPlugin.h"
#import "TencentCameraPusherFactory.h"


@implementation TencentCameraPusherPlugin

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    
    //注册插件
    //注册 FlutterIosTextLabelFactory
    //com.flutter_to_native_test_textview 为flutter 调用此  textLabel 的标识
    [registrar registerViewFactory:[[TencentCameraPusherFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.tencent.live.camera_push"];
}

@end
