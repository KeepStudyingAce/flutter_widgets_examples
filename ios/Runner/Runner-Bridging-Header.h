#import "GeneratedPluginRegistrant.h"
#import "FlutterIosTextLabelRegister.h"
#import "TencentLivePlayerRegister.h"
#import "TencentCameraPusherRegister.h"
#import "TencentScreenPusherRegister.h"
#import "AppFlutterMethodHandle.h"

#ifdef ENABLE_TRTC
#ifdef ENABLE_PLAY
#import "TRTCCloud.h"
#import "TXLiveBase.h"  //TRTC
#else
#import "TRTCCloud.h"   //TRTC_Smart
#endif
#else
#import "TXLiveBase.h"  //非TRTC
#endif
