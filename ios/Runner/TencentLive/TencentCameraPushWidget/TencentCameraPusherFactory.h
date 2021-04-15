//
//  TencentCameraPushFactory.h
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/15.
//

#ifndef TencentCameraPusherFactory_h
#define TencentCameraPusherFactory_h


#endif /* TencentCameraPusherFactory_h */
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface TencentCameraPusherFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

@end

NS_ASSUME_NONNULL_END
