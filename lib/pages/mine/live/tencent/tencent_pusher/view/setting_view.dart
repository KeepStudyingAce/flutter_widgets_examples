import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';

class SettingView extends StatefulWidget {
  SettingView({Key key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConfig.screenHeight(context) / 2.0,
      width: AppConfig.screenWidth(context),
      padding: EdgeInsets.all(10),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildCell(title: "画质偏好", subTitle: "蓝光", onClick: () {}),
          _buildCell(title: "音质选择", subTitle: "蓝光", onClick: () {}),
          _buildSwitch(
            title: "开启宽带适应",
            onClick: (switchOn) {
              print("开启宽带适应:$switchOn");
            },
          ),
          SizedBox(height: 20),
          _buildSwitch(
            title: "开启硬件加速",
            onClick: (switchOn) {
              print("开启硬件加速:$switchOn");
            },
          ),
          SizedBox(height: 20),
          _buildSwitch(
            title: "开启耳返",
            onClick: (switchOn) {
              print("开启耳返:$switchOn");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCell({String title, String subTitle, Function onClick}) {
    return SizedBox(
      width: AppConfig.screenWidth(context),
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: CommonColors.white50Color,
              fontSize: 12,
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                subTitle,
                style: TextStyle(
                  color: CommonColors.whiteColor,
                  fontSize: 14,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: CommonColors.whiteColor,
              ),
              onTap: onClick,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitch({String title, Function(bool) onClick}) {
    return SizedBox(
      width: AppConfig.screenWidth(context),
      height: 40,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyle(
            color: CommonColors.whiteColor,
            fontSize: 14,
          ),
        ),
        trailing: CupertinoSwitch(value: true, onChanged: onClick),
      ),
    );
  }
}
