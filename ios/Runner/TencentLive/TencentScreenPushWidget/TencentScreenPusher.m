//
//  TencentScreenPushWidget.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/15.
//


#import "TXLivePush.h"
#import "TencentScreenPusher.h"
#import "SimpleIPC.h"
#import "ReplayKit2Define.h"

@interface TencentScreenPusher() <TXLivePushListener,FlutterStreamHandler>
@property (nonatomic, strong) TXLivePush *pusher;
@property (nonatomic, strong) NSString *pushUrl;
//Native->Flutter端主动消息通道
@property(nonatomic,strong)FlutterEventSink eventSink;
@end

@implementation TencentScreenPusher{
    //TencentLivePlayer 创建后的标识
    int64_t _viewId;
    //消息回调
    FlutterMethodChannel* _channel;
    // Native->Flutter端主动消息通道
    FlutterEventChannel* _eventChannel;
    UIView              *_localView;    // 本地预览
    SimpleIPC *_ipc;
}

//在这里只是创建了一个UILabel
-(instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width==0) {
            frame=CGRectMake(frame.origin.x, frame.origin.y, [UIScreen mainScreen].bounds.size.width, frame.size.height);
        }
        // 注册flutter 与 ios 通信通道
        NSString* channelName = [NSString stringWithFormat:@"com.tencent.live.screen_push_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];
        
        //Native->Flutter端消息通道
        NSString* eventChannelName = [NSString stringWithFormat:@"com.tencent.live.screen_push.event_%lld", viewId];
        _eventChannel =[FlutterEventChannel eventChannelWithName:eventChannelName binaryMessenger:messenger];
        [_eventChannel setStreamHandler:self];
        
        _ipc = [[SimpleIPC alloc] initWithPort:kReplayKitIPCPort];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onReplayKit2RecordStop:) name:kCocoaNotificationNameReplayKit2Stop object:nil];
        // 本地视频预览view
        _localView = [[UIView alloc] initWithFrame:self.view.bounds];
        self.pushUrl = args[@"pushUrl"];
        _pusher = [self createPusher];
    }
    return self;
    
}
-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    if ([[call method] isEqualToString:@"Play"]) {
        [self startPush:result];
    }else if ([[call method] isEqualToString:@"Stop"]) {
        [self stopPush];
    }else if ([[call method] isEqualToString:@"switchPortrait"]) {
        
            [self onSwitchRotation:[call.arguments integerValue]];
        
    }else {
        //其他方法的回调
    }
}

//停止录屏
- (void)onReplayKit2RecordStop:(NSNotification*)noti
{
    NSLog(@"开始推流");
}

#pragma mark - 推流逻辑

- (void)startPush:(FlutterResult)result {
    // 检查摄像头权限
    if ([UIDevice currentDevice].systemVersion.floatValue < 11.0) {
        result(@"录屏只支持iOS11以上系统，请升级！");
        return ;
    }
    
    // 检查麦克风权限
    AVAuthorizationStatus statusAudio = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (statusAudio == AVAuthorizationStatusDenied) {
        result(@"请先检查麦克风权限");
        return;
    }
    
    BOOL isCaptured = NO;
    if (@available(iOS 11, *)) {
        isCaptured = [UIScreen mainScreen].isCaptured;
    }
    if (!isCaptured) {
        NSString* message = @"请先到控制中心->长按启动屏幕录制";
        result(message);
        return;
    } else {
        NSString* resolution = kResolutionFHD;//超清；kResolutionHD：高清; kResolutionSD:标清;
        NSMutableDictionary* dict = [NSMutableDictionary new];
        [dict setObject:self.pushUrl forKey:kReplayKit2PushUrlKey];
        [dict setObject:resolution forKey:kReplayKit2ResolutionKey];
        [dict setObject:kReplayKit2Portrait forKey:kReplayKit2RotateKey];
        [self _sendMessageToExtension:kDarvinNotificationNamePushStart object:dict];
    }

}

- (void)stopPush {
    [self _sendMessageToExtension:kDarvinNotificaiotnNamePushStop object:@{}];
}

//0:横屏；1:竖屏
- (void)onSwitchRotation:(NSInteger)rotation
{

    NSString* rotationStr = rotation == 0?kReplayKit2Portrait:kReplayKit2Lanscape;
    [self _sendMessageToExtension:kDarvinNotificaiotnNameRotationChange
                           object:@{kReplayKit2RotateKey: rotationStr}];
}

- (void)_sendMessageToExtension:(CFStringRef)message object:(NSDictionary *)object {
    if (object) {
#if kReplayKitUseAppGroup
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:kReplayKit2AppGroupId];
        [defaults setValuesForKeysWithDictionary:object];
        [defaults synchronize];
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), message, NULL, nil, YES);
#else
//        UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:@"TXLiteAV" create:YES];
//        NSString* transString = [self dictionary2JsonString:object];
//        if (!transString)
//            return;
//        pasteboard.string = transString;
        [_ipc sendCmd:(__bridge NSString *)message info:object];
#endif
    }
}


// 创建推流器，并使用本地配置初始化它
- (TXLivePush *)createPusher {
    // config初始化
    TXLivePushConfig *config = [[TXLivePushConfig alloc] init];
    config.pauseFps = 10;
    config.pauseTime = 300;
    config.pauseImg = [UIImage imageNamed:@"pause_publish"];
    config.touchFocus = NO;
    config.enableZoom = NO;
    config.enablePureAudioPush =NO;
    config.enableAudioPreview = NO;
    config.audioChannels = 2;
    config.audioSampleRate = AUDIO_SAMPLE_RATE_48000;
    
//    switch (audioQuality) {
//        case 2:
//            // 音乐音质，采样率48000
//            config.audioChannels = 2;
//            config.audioSampleRate = AUDIO_SAMPLE_RATE_48000;
//            break;
//        case 1:
//            // 标准音质，采样率48000
//            config.audioChannels = 1;
//            config.audioSampleRate = AUDIO_SAMPLE_RATE_48000;
//            break;
//        case 0:
//            // 语音音质，采样率16000
//            config.audioChannels = 1;
//            config.audioSampleRate = AUDIO_SAMPLE_RATE_16000;
//            break;
//        default:
//            break;
//    }
    //前后置摄像头
    config.frontCamera = YES;
    
    //水印 位置
//    config.watermark = [UIImage imageNamed:@"watermark"];
//    config.watermarkPos = CGPointMake(10, 10);
    
    // 推流器初始化
    TXLivePush *pusher = [[TXLivePush alloc] initWithConfig:config];
    [pusher toggleTorch:YES];
    [pusher setMirror:YES];
    [pusher setMute:YES];
    [pusher setVideoQuality:VIDEO_QUALITY_SUPER_DEFINITION adjustBitrate:NO adjustResolution:NO];

#ifdef ENABLE_CUSTOM_MODE_AUDIO_CAPTURE
    config.enableAEC = NO;
    config.customModeType = CUSTOM_MODE_AUDIO_CAPTURE;
    config.audioSampleRate = CUSTOM_AUDIO_CAPTURE_SAMPLERATE;
    config.audioChannels = CUSTOM_AUDIO_CAPTURE_CHANNEL;
#endif
    
    // 修改软硬编需要在setVideoQuality之后设置config.enableHWAcceleration
    config.enableHWAcceleration = NO;
    
    // 横屏推流需要先设置config.homeOrientation = HOME_ORIENTATION_RIGHT，然后再[pusher setRenderRotation:90]
    config.homeOrientation = HOME_ORIENTATION_RIGHT;//( HOME_ORIENTATION_RIGHT : HOME_ORIENTATION_DOWN);
    [pusher setRenderRotation:90];
//    if ([PushMoreSettingViewController isHorizontalPush]) {
//        [pusher setRenderRotation:90];
//    } else {
//        [pusher setRenderRotation:0];
//    }
    
    
    [pusher setLogViewMargin:UIEdgeInsetsMake(120, 10, 60, 10)];
    [pusher showVideoDebugLog:YES];
    [pusher setEnableClockOverlay:NO];
    
    [pusher setConfig:config];
    
    return pusher;
}


- (nonnull UIView *)view {
    return _localView;
}

- (void)onNetStatus:(NSDictionary *)param {
}

- (void)onPushEvent:(int)evtID withParam:(NSDictionary *)param {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (evtID == PUSH_ERR_NET_DISCONNECT || evtID == PUSH_ERR_INVALID_ADDRESS) {
            // 断开连接时，模拟点击一次关闭推流
            NSLog(@"关闭推流");
            
        } else if (evtID == PUSH_ERR_OPEN_CAMERA_FAIL) {
            NSLog(@"摄像头启动失败");
            NSLog(@"获取摄像头权限失败，请前往隐私-相机设置里面打开应用权限");
            
        } else if (evtID == PUSH_EVT_OPEN_CAMERA_SUCC) {
            NSLog(@"保存摄像头设置");

        } else if (evtID == PUSH_ERR_OPEN_MIC_FAIL) {
            NSLog(@"麦克风启动失败");
            NSLog(@"获取麦克风权限失败，请前往隐私-麦克风设置里面打开应用权限");
            
        } else if (evtID == PUSH_EVT_CONNECT_SUCC) {
            NSLog(@"正在推流.....");
        } else if (evtID == PUSH_WARNING_NET_BUSY) {
            NSLog(@"您当前的网络环境不佳，请尽快更换网络保证正常直播");
        }
        
    });
}

- (void)onScreenCapturePaused:(int)reason {
    NSLog(@"onScreenCapturePaused");
}

- (void)onScreenCaptureResumed:(int)reason {
    NSLog(@"onScreenCaptureResumed");
}

- (void)onScreenCaptureStarted {
    NSLog(@"onScreenCaptureStarted");
}

- (void)onScreenCaptureStoped:(int)reason {
    NSLog(@"onScreenCaptureStoped");
}


#pragma mark - FlutterStreamHandler Native->Flutter 传递事件
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)eventSink{
    self.eventSink = eventSink;
    return nil;
}
 
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    return nil;
}

@end




