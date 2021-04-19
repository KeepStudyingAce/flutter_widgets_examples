import 'package:flutter/material.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';

class SelfKeyBoard extends StatelessWidget {
  static const CKTextInputType inputType = const CKTextInputType(
      name: 'CKSelfKeyBoard', params: "自定义键盘"); //定义InputType类型
  static double getHeight(BuildContext ctx) {
    //编写获取高度的方法
    return 200 + AppConfig.iphoneXBottomHeight(ctx);
  }

  final KeyboardController controller; //用于控制键盘输出的Controller
  const SelfKeyBoard({this.controller});

  static register() {
    //注册键盘的方法
    CoolKeyboard.addKeyboard(
        SelfKeyBoard.inputType,
        KeyboardConfig(
            builder: (context, controller, params) {
              print("可以传入参数");
              return SelfKeyBoard(controller: controller);
            },
            getHeight: SelfKeyBoard.getHeight));
  }

  @override
  Widget build(BuildContext context) {
    //键盘的具体内容
    return Container(
      //例子
      height: 200 + AppConfig.iphoneXBottomHeight(context),
      color: CommonColors.greenColor,
      padding: EdgeInsets.only(bottom: AppConfig.iphoneXBottomHeight(context)),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: AppConfig.screenWidth(context) / 3 / 30),
        itemBuilder: (context, index) {
          String text = (10 - index).toString();
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              color: Colors.red,
              margin: EdgeInsets.all(2),
              child: Text(
                text,
                style: TextStyle(fontSize: 15, color: CommonColors.whiteColor),
              ),
            ),
            onTap: () {
              controller.addText(text); //往输入框光标位置添加一个1
            },
          );
        },
      ),
    );
  }
}
