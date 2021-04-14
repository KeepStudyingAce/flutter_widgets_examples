//
//  TencentLivePlayerFactory.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/12.
//

#import "TencentLivePlayerFactory.h"
#import "TencentLivePlayer.h"

@implementation TencentLivePlayerFactory{
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
    TencentLivePlayer *player = [[TencentLivePlayer alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return player;
}

@end

