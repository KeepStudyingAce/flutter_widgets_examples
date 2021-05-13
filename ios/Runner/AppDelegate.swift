import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var methodChannel:FlutterMethodChannel?;
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let flVC = FlutterViewController.init();
    self.window = UIWindow.init(frame: UIScreen.main.bounds);
    self.window.rootViewController = flVC;
    GeneratedPluginRegistrant.register(with: self)
    self.window.makeKeyAndVisible();
    //自定义Label原生组件注册
    FlutterIosTextLabelRegister.register(with: self)
    
    #warning("===腾讯直播相关===")
    //更换自己的推流Key和LicenseUrl 与bundleId一一对应 有问题无法推流成功
    TXLiveBase.setLicenceURL("http://license.vod2.myqcloud.com/license/v1/a39a6f961c76aed635351a9b26968d8f/TXLiveSDK.licence", key: "dcc2ec090d890d6a9a4104d0bd3497ea")
    //自定义腾讯直播拉流播放器
    TencentLivePlayerRegister.register(with: self)
    //自定义腾讯直播摄像头推流
    TencentCameraPusherRegister.register(with: self)
    
    
    #warning("===处理flutter通信===")
    methodChannel = FlutterMethodChannel.init(name: "com.ace.flutter/native", binaryMessenger: flVC as! FlutterBinaryMessenger);
    //处理函数
    methodChannel?.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        AppFlutterMethodHandle.handle(call, result: result)
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
