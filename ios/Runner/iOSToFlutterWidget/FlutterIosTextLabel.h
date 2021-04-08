//
//  FlutterIosTextLabel.h
//  Runner
//
//  Created by 金蚁-iOS on 2021/4/8.
//

#ifndef FlutterIosTextLabel_h
#define FlutterIosTextLabel_h


#endif /* FlutterIosTextLabel_h */
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

//实现协议FlutterPlatformView
@interface FlutterIosTextLabel :  NSObject<FlutterPlatformView>

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                 binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END

