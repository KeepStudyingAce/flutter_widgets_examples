//
//  TencentScreenPusher.h
//  Runner
//
//  Created by 金蚁-iOS on 2021/5/19.
//

#ifndef TencentScreenPusher_h
#define TencentScreenPusher_h


#endif /* TencentScreenPusher_h */

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

//实现协议FlutterPlatformView
@interface TencentScreenPusher :  NSObject<FlutterPlatformView>

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                 binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END

