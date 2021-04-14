//
//  TencentLivePlayerFactory.h
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/12.
//

#ifndef TencentLivePlayerFactory_h
#define TencentLivePlayerFactory_h


#endif /* TencentLivePlayerFactory_h */
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface TencentLivePlayerFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

@end

NS_ASSUME_NONNULL_END
