//
//  TencentScreenPusherFactory.h
//  AceReplaykitUpload
//
//  Created by 金蚁-iOS on 2021/5/19.
//

#ifndef TencentScreenPusherFactory_h
#define TencentScreenPusherFactory_h


#endif /* TencentScreenPusherFactory_h */
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface TencentScreenPusherFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

@end

NS_ASSUME_NONNULL_END
