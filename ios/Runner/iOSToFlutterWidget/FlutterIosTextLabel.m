//
//  FlutterIosTextLabel.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/8.
//

#import "FlutterIosTextLabel.h"

@implementation FlutterIosTextLabel{
    //FlutterIosTextLabel 创建后的标识
    int64_t _viewId;
    UILabel * _uiLabel;
    //消息回调
    FlutterMethodChannel* _channel;
}

//在这里只是创建了一个UILabel
-(instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width==0) {
            frame=CGRectMake(frame.origin.x, frame.origin.y, [UIScreen mainScreen].bounds.size.width, 22);
        }
        // 注册flutter 与 ios 通信通道
        NSString* channelName = [NSString stringWithFormat:@"com.flutter_to_native_test_textview_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];
        _uiLabel =[[UILabel alloc] initWithFrame:frame];
        _uiLabel.textColor=[UIColor redColor];
        //接收 初始化参数
        NSDictionary *dic = args;
        NSString *content = dic[@"content"];
        if (content!=nil) {
            _uiLabel.text=content;
        } else {
            _uiLabel.text=@"ios 原生 uilabel ";
        }
        _uiLabel.font=[UIFont systemFontOfSize:14];
        _uiLabel.textAlignment=NSTextAlignmentCenter;
        _uiLabel.backgroundColor=[UIColor grayColor];
        
        _viewId = viewId;
    
    }
    return self;
    
}

-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    if ([[call method] isEqualToString:@"updateText"]) {
        //获取参数
        NSString *content = call.arguments ;
        if (content!=nil) {
            _uiLabel.text = content;
        }
    }else{
        //其他方法的回调
    }
}


- (nonnull UIView *)view {
    return _uiLabel;
}

@end

