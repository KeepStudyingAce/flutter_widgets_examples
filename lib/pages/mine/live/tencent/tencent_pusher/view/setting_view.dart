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
          SizedBox(
            width: AppConfig.screenWidth(context),
            height: 40,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              // tileColor: CommonColors.whiteColor,
              title: Text(
                '蓝光',
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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell({String title,Function onClick}) {
    return SizedBox(
      width: AppConfig.screenWidth(context),
      height: 40,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        // tileColor: CommonColors.whiteColor,
        title: Text(
          '蓝光',
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
        onTap: () {},
      ),
    );
  }
}
