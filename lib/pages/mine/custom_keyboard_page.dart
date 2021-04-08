import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class CustomKeyboardPage extends StatefulWidget {
  CustomKeyboardPage({Key key}) : super(key: key);

  @override
  _CustomKeyboardPageState createState() => _CustomKeyboardPageState();
}

class _CustomKeyboardPageState extends State<CustomKeyboardPage> {
  final TextEditingController _telCl = new TextEditingController(text: "");
  final TextEditingController _pwdCl = new TextEditingController(text: "");
  final FocusNode _telNode = new FocusNode();
  final FocusNode _pwdNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _telNode.addListener(() {
      if (_telNode.hasFocus) {
        ToastUtil.showToast("手机号输入框聚焦");
        SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
        // SystemChannels.textInput.invokeMethod<void>('TextInput.clearClient');
      }
    });
    _pwdNode.addListener(() {
      if (_pwdNode.hasFocus) {
        ToastUtil.showToast("密码输入框聚焦");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: "CustomKeyBoard",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12),
              _buildTel(),
              SizedBox(height: 12),
              _buildPwd(),
            ],
          ),
        ));
  }

  Widget _buildTel() {
    return Container(
      width: AppConfig.screenWidth(context) - 12 * 2,
      decoration: BoxDecoration(
        color: CommonColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      child: Container(
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
        ),
        constraints: BoxConstraints(
          maxHeight: 50,
          minHeight: 50,
        ),
        child: TextField(
          cursorColor: CommonColors.blackColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            filled: true,
            hintText: "请输入手机号",
            hintStyle:
                TextStyle(fontSize: 14, color: CommonColors.black50Color),
            fillColor: CommonColors.transparent,
            border: InputBorder.none,
            counterText: "",
          ),
          onChanged: (text) {
            print("输入手机号:$text");
          },
          focusNode: _telNode,
          controller: _telCl,
          keyboardType: TextInputType.number,
          maxLength: 11,
        ),
      ),
    );
  }

  Widget _buildPwd() {
    return Container(
      width: AppConfig.screenWidth(context) - 12 * 2,
      decoration: BoxDecoration(
        color: CommonColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      child: Container(
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
        ),
        constraints: BoxConstraints(
          maxHeight: 50,
          minHeight: 50,
        ),
        child: TextField(
          cursorColor: CommonColors.blackColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            filled: true,
            hintText: "请输入密码",
            hintStyle:
                TextStyle(fontSize: 14, color: CommonColors.black50Color),
            fillColor: CommonColors.transparent,
            border: InputBorder.none,
            counterText: "",
          ),
          onChanged: (text) {
            print("输入密码:$text");
          },
          focusNode: _pwdNode,
          controller: _pwdCl,
          maxLength: 11,
        ),
      ),
    );
  }
}
