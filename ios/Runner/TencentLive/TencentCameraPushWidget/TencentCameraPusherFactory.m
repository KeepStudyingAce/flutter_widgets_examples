//
//  TencentCameraPushFactory.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/15.
//

#import "TencentCameraPusherFactory.h"
#import "TencentCameraPusher.h"

@implementation TencentCameraPusherFactory{
     NSObject<FlutterBinaryMessenger>*_messenger;
}
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

//设置参数的编码方式
-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

//用来创建 ios 原生view
- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    //args 为flutter 传过来的参数
    TencentCameraPusher *pusher = [[TencentCameraPusher alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return pusher;
}

@end
