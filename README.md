# flutter_widgets_example

所有的组件均为个人认为不太常用或者个人用的次数比较少的组件，仅供参考；

## Flutter组件集合，总结自己练习的小项目以及两个电商项目的合集，持续更新...

1、使用intl_utils多语言配置文件，每次更新.arb文件后需要运行 
  
    flutter pub run intl_utils:generate 
  
    会在generated中自动生成get方法供外部调用；

2、flutter_swiper:多种样式的轮播图，支持自定以指示器

3、DragSortView：自己实现拖动图片排序组件

4、百度地图iOS配置步骤：

官方地址：http://lbsyun.baidu.com/index.php?title=flutter/loc/create-project/configure

iOS工程配置:
     
     1）、iOS端的UiKitView目前还只是preview状态, 默认是不支持的, 需要手动打开开关, 需要在iOS工程的info.plist添加如下配置：
           
        <key>io.flutter.embedded_views_preview</key>
        <string>YES</string>
     
      2）、地图sdk鉴权需要配置BundleDisplayName, 需要在iOS工程Info.plist中添加如下配置：
        <key>CFBundleDisplayName</key>
        <string>app名称</string>
        
5、腾讯直播SDK Flutter桥接：

    5.1、由于framework文件太大，所以不加入到版本控制，实际运行的时候去官网下载(下载链接：https://cloud.tencent.com/document/product/454/7873)

    本次使用的是TXLiteAVSDK_Smart.framework 8.5.10022版本

