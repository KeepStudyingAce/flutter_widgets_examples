//
//  TencentLivePlayer.h
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/12.
//

#ifndef TencentLivePlayer_h
#define TencentLivePlayer_h


#endif /* TencentLivePlayer_h */
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

//实现协议FlutterPlatformView
@interface TencentLivePlayer :  NSObject<FlutterPlatformView>

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                 binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END
