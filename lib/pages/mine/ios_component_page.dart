import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

//Flutter调用原生组件
class IOSComponentPage extends StatefulWidget {
  IOSComponentPage({Key key}) : super(key: key);

  @override
  _IOSComponentPageState createState() => _IOSComponentPageState();
}

class _IOSComponentPageState extends State<IOSComponentPage> {
  MethodChannel _channel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Flutter嵌套原生组件",
      ),
      body: Column(
        children: [
          Text(
            "需运行iOS原生工程",
            style: TextStyle(fontSize: 15, color: CommonColors.red50Color),
          ),
          Container(
            height: 200,
            child: UiKitView(
              //设置标识 这里设置的viewType值与 ios 中插件注册的标识一致 需要云心原生工程
              viewType: "com.flutter_to_native_test_textview",
              creationParams: {
                "content": "flutter 传入的文本内容",
              },
              //参数的编码方式 设置creationParams后必传参数
              creationParamsCodec: StandardMessageCodec(),
              //view创建完成时的回调
              onPlatformViewCreated: (id) {
                _channel = new MethodChannel(
                    'com.flutter_to_native_test_textview_$id');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Update ios Label Text"),
        onPressed: () {
          _channel.invokeMethod('updateText', "更新内容");
        },
      ),
    );
  }
}
