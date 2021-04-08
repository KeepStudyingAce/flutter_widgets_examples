//
//  FlutterIosTextLabelFactory.h
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/8.
//

#ifndef FlutterIosTextLabelFactory_h
#define FlutterIosTextLabelFactory_h


#endif /* FlutterIosTextLabelFactory_h */
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface FlutterIosTextLabelFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

@end

NS_ASSUME_NONNULL_END

