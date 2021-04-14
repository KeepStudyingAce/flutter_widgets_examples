#import "AppFlutterMethodHandle.h"
#import "GenerateTestUserSig.h"

@interface AppFlutterMethodHandle(){

}

@end

@implementation AppFlutterMethodHandle

+ (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getTencentSign" isEqualToString:call.method]) {
      result([GenerateTestUserSig genTestUserSig:call.arguments]);
    }else {
      result(FlutterMethodNotImplemented);
    }
}

@end
