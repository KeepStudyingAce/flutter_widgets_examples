//
//  TencentLivePlayer.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/12.
//

#import "TXLivePlayer.h"
#import "TencentLivePlayer.h"
#define CACHE_TIME_FAST             1.0f
#define CACHE_TIME_SMOOTH           5.0f
typedef NS_ENUM(NSInteger, ENUM_TYPE_CACHE_STRATEGY) {
    CACHE_STRATEGY_FAST           = 1,  // 极速
    CACHE_STRATEGY_SMOOTH         = 2,  // 流畅
    CACHE_STRATEGY_AUTO           = 3,  // 自动
};
@interface TencentLivePlayer() <TXLivePlayListener,FlutterStreamHandler>
{
    TX_Enum_PlayType     _playType;        // 播放类型
}
@property (nonatomic, strong) TXLivePlayer *player;
@property (nonatomic, strong) NSString *playUrl;
@property (nonatomic, assign) BOOL showLog;
@property (nonatomic, assign) BOOL orientationDown;
@property (nonatomic, assign) BOOL fillScreen;
//Native->Flutter端主动消息通道
@property(nonatomic,strong)FlutterEventSink eventSink;
@end

@implementation TencentLivePlayer{
    //TencentLivePlayer 创建后的标识
    int64_t _viewId;
    UIView  *_videoView;
    // Flutter->Native端主动消息通道
    FlutterMethodChannel* _methodChannel;
    // Native->Flutter端主动消息通道
    FlutterEventChannel* _eventChannel;
}

//在这里只是创建了一个UILabel
-(instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width==0) {
            frame=CGRectMake(frame.origin.x, frame.origin.y, [UIScreen mainScreen].bounds.size.width, frame.size.height);
        }
        // 注册flutter 与 ios 通信通道
        //Flutter->Native端消息通道
        NSString* channelName = [NSString stringWithFormat:@"com.tencent.live.player_%lld", viewId];
        _methodChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_methodChannel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];
        
        //Native->Flutter端消息通道
        NSString* eventChannelName = [NSString stringWithFormat:@"com.tencent.live.player.event_%lld", viewId];
        _eventChannel =[FlutterEventChannel eventChannelWithName:eventChannelName binaryMessenger:messenger];
        [_eventChannel setStreamHandler:self];
        // 初始化页面
        _player = [[TXLivePlayer alloc] init];
        
        TXLivePlayConfig* config = _player.config;
        // 开启 flvSessionKey 数据回调
        //config.flvSessionKey = @"X-Tlive-SpanId";
        // 允许接收消息
        config.enableMessage = YES;
        [_player setConfig:config];
        self.playUrl = args[@"playUrl"];
        _videoView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _viewId = viewId;
    
    }
    return self;
    
}

-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    if ([[call method] isEqualToString:@"Play"]) {
        [self startPlay:result];
    }else if ([[call method] isEqualToString:@"Pause"]) {
        [self pausePlay];
    }else if ([[call method] isEqualToString:@"Resume"]) {
        [self resumePlay];
    }else if ([[call method] isEqualToString:@"Stop"]) {
        if (_player) {
            [self stopPlay];
        }
    }else if ([[call method] isEqualToString:@"showLog"]) {
        if (_player) {
            [_player setLogViewMargin:UIEdgeInsetsMake(120, 10, 60, 10)];
            self.showLog = self.showLog?false:true;
            [_player showVideoDebugLog:self.showLog];
        }
    }else if ([[call method] isEqualToString:@"switchHW"]) {
        if (_player) {
            [self switchHW:result];
        }
    }else if ([[call method] isEqualToString:@"switchPortrait"]) {
        if (_player) {
            [self clickPortrait];
        }
    }else  if ([[call method] isEqualToString:@"switchRenderMode"]) {
        if (_player) {
            [self clickRenderMode];
        }
    }else  if ([[call method] isEqualToString:@"switchCacheStrategy"]) {
        if (_player) {
            [self setCacheStrategy:[call.arguments integerValue]];
        }
    }else  if ([[call method] isEqualToString:@"getStatus"]) {
        if (_player) {
//            [self getCurrentStatus:result withParams:[NSString stringWithFormat:@"%@",call.arguments] ];
        }
    }else{
        //其他方法的回调
    }
}

//开始播放
-(void) startPlay:(FlutterResult)result{
    if (_player.isPlaying){
        return;
    }
    [_player setDelegate:self];
    self.showLog = false;
    self.orientationDown = true;
    self.fillScreen = false;
    [self setCacheStrategy:CACHE_STRATEGY_AUTO];
    [self checkPlayUrl:self.playUrl];
    [_player setupVideoWidget:CGRectZero containView:_videoView insertIndex:0];
    int ret = [_player startPlay:self.playUrl type:_playType];
    if (ret != 0) {
        result(@"播放器启动失败");
    }
}
//暂停播放
-(void) pausePlay{
    if (_player != nil && _player.isPlaying){
        [_player pause];
    }
}
//继续播放
-(void) resumePlay{
    if (_player != nil){
        [_player resume];
    }
}

//停止播放
-(void) stopPlay{
    [_player setDelegate:nil];
    [_player removeVideoWidget];
    [_player stopPlay];
}
//修改解码方式
-(void) switchHW:(FlutterResult)result{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        result(@"iOS 版本低于8.0，不支持硬件加速.");
        return;
    }
    
    if (_player.isPlaying) {
        [_player stopPlay];
    }
    
    _player.enableHWAcceleration = !_player.enableHWAcceleration;
    BOOL isHW = _player.enableHWAcceleration;
   
    
    if (!_player.isPlaying) {
        if (isHW) {
            result(@"切换为硬解码. 重启播放流程");
        }
        else {
            result(@"切换为软解码. 重启播放流程");
        }
        
        [self startPlay:result];
    }
}
//横竖屏
- (void)clickPortrait {
    if (!self.orientationDown) {
        self.orientationDown = true;
        [_player setRenderRotation:HOME_ORIENTATION_DOWN];
    } else {
        self.orientationDown = false;
        [_player setRenderRotation:HOME_ORIENTATION_RIGHT];
    }
}

//放大/缩小
- (void)clickRenderMode {
    if (self.fillScreen) {
        self.fillScreen = false;
        [_player setRenderMode:RENDER_MODE_FILL_EDGE];
    } else {
        self.fillScreen = true;
        [_player setRenderMode:RENDER_MODE_FILL_SCREEN];
    }
}

// 设置缓冲策略
- (void)setCacheStrategy:(NSInteger)cacheStrategy {
    TXLivePlayConfig *config = _player.config;
    switch (cacheStrategy) {
        case CACHE_STRATEGY_FAST:
            config.bAutoAdjustCacheTime = YES;
            config.minAutoAdjustCacheTime = CACHE_TIME_FAST;
            config.maxAutoAdjustCacheTime = CACHE_TIME_FAST;
            [_player setConfig:config];
            break;
            
        case CACHE_STRATEGY_SMOOTH:
            config.bAutoAdjustCacheTime = NO;
            config.minAutoAdjustCacheTime = CACHE_TIME_SMOOTH;
            config.maxAutoAdjustCacheTime = CACHE_TIME_SMOOTH;
            [_player setConfig:config];
            break;
            
        case CACHE_STRATEGY_AUTO:
            config.bAutoAdjustCacheTime = YES;
            config.minAutoAdjustCacheTime = CACHE_TIME_FAST;
            config.maxAutoAdjustCacheTime = CACHE_TIME_SMOOTH;
            [_player setConfig:config];
            break;
            
        default:
            break;
    }
}

//-(void) getCurrentStatus:(FlutterResult)result withParams:(NSString*)param{
//    if ([param isEqualToString:@"isPlaying"]){
//        result(_player.isPlaying ? @"1":@"0");
//    }
//}


-(BOOL)checkPlayUrl:(NSString*)playUrl {
  
        if ([playUrl hasPrefix:@"rtmp:"]) {
            _playType = PLAY_TYPE_LIVE_RTMP;
        } else if (([playUrl hasPrefix:@"https:"] || [playUrl hasPrefix:@"http:"]) && ([playUrl rangeOfString:@".flv"].length > 0)) {
            _playType = PLAY_TYPE_LIVE_FLV;
        } else if (([playUrl hasPrefix:@"https:"] || [playUrl hasPrefix:@"http:"]) && [playUrl rangeOfString:@".m3u8"].length > 0) {
            _playType = PLAY_TYPE_VOD_HLS;
        } else{
            NSLog(@"播放地址不合法，直播目前仅支持rtmp,flv播放方式!");
            return NO;
        }
    
    return YES;
}


- (nonnull UIView *)view {
    return _videoView;
}

- (void)onNetStatus:(NSDictionary *)param {
//    NSLog(@"onNetStatus%@",param);
}

- (void)onPlayEvent:(int)EvtID withParam:(NSDictionary *)param {
    dispatch_async(dispatch_get_main_queue(), ^{
         if (self.eventSink != nil){
            self.eventSink(@{@"eventId": [NSString stringWithFormat:@"%d", EvtID] ,@"params":param});
         }
    });
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


