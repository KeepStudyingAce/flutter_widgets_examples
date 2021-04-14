//
//  TencentLivePlayer.m
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/12.
//

#import "TXLivePlayer.h"
#import "TencentLivePlayer.h"
@interface TencentLivePlayer() <TXLivePlayListener>
{
    TX_Enum_PlayType     _playType;        // 播放类型
}
@property (nonatomic, strong) TXLivePlayer *player;
@property (nonatomic, strong) NSString *playUrl;
@end

@implementation TencentLivePlayer{
    //TencentLivePlayer 创建后的标识
    int64_t _viewId;
    UIView  *_videoView;
    //消息回调
    FlutterMethodChannel* _channel;
}

//在这里只是创建了一个UILabel
-(instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width==0) {
            frame=CGRectMake(frame.origin.x, frame.origin.y, [UIScreen mainScreen].bounds.size.width, frame.size.height);
        }
        // 注册flutter 与 ios 通信通道
        NSString* channelName = [NSString stringWithFormat:@"com.tencent.live.player_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];
        
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
        [_player setDelegate:self];
        [self checkPlayUrl:self.playUrl];
        [_player setupVideoWidget:CGRectZero containView:_videoView insertIndex:0];
        int ret = [_player startPlay:self.playUrl type:_playType];
        if (ret != 0) {
            NSLog(@"播放器启动失败");
        }
    }else if ([[call method] isEqualToString:@"Stop"]) {
        if (_player) {
            [_player setDelegate:nil];
            [_player removeVideoWidget];
            [_player stopPlay];
        }
    }{
        //其他方法的回调
    }
}

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
    NSLog(@"onNetStatus%@",param);
}

- (void)onPlayEvent:(int)EvtID withParam:(NSDictionary *)param {
    NSLog(@"onPlayEvent%@",param);
}

@end


