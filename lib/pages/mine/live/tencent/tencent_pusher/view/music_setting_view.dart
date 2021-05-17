import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';

const List<Map<String, dynamic>> data = [
  {
    "title": "变声",
    "list": [
      "原生",
      "熊孩子",
      "萝莉",
      "大叔",
      "重金属",
      "感冒",
      "外国人",
      "困兽",
      "死肥宅",
      "强电流",
      "重机械",
      "空灵",
    ]
  },
  {
    "title": "混响",
    "list": [
      "无效果",
      "KTV",
      "小房间",
      "大会堂",
      "低沉",
      "洪亮",
      "金属声",
      "磁性",
    ]
  }
];

class MusicSettingView extends StatefulWidget {
  MusicSettingView({Key key}) : super(key: key);

  @override
  _MusicSettingViewState createState() => _MusicSettingViewState();
}

class _MusicSettingViewState extends State<MusicSettingView> {
  double _musicVolumn = 100;
  double _voiceVolumn = 100;
  double _stepVolumn = 0;
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
                '背景音乐',
                style: TextStyle(
                  color: CommonColors.whiteColor,
                  fontSize: 14,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "选择歌曲",
                    style: TextStyle(
                      color: CommonColors.whiteColor,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CommonColors.whiteColor,
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
          _buildVolumn(
            title: "音乐音量",
            slider: _musicVolumn,
            onClick: (value) {
              setState(
                () {
                  _musicVolumn = value;
                },
              );
            },
          ),
          _buildVolumn(
            title: "人声音量",
            slider: _voiceVolumn,
            onClick: (value) {
              setState(
                () {
                  _voiceVolumn = value;
                },
              );
            },
          ),
          _buildVolumn(
            title: "音乐升降调",
            slider: _stepVolumn,
            isStep: true,
            onClick: (value) {
              setState(
                () {
                  _stepVolumn = value;
                },
              );
            },
          ),
          ...(List.generate(data.length, (index) {
            return _buildList(
                title: data[index]["title"], list: data[index]["list"]);
          }))
        ],
      ),
    );
  }

  Widget _buildVolumn(
      {String title,
      double slider,
      Function(double) onClick,
      bool isStep = false}) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: CommonColors.whiteColor,
            ),
          ),
          Expanded(
            child: Slider(
              value: slider,
              onChanged: (data) {
                onClick(data);
              },
              onChangeStart: (data) {
                print('start:$data');
              },
              onChangeEnd: (data) {
                print('end:$data');
              },
              min: isStep ? -1 : 0.0,
              max: isStep ? 1 : 100.0,
              divisions: isStep ? 1 : null,
              label: '$slider',
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()} newValue}';
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList({String title, List<String> list}) {
    return Container(
        height: 80,
        width: AppConfig.screenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(color: CommonColors.whiteColor, fontSize: 15),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  String subtitle = list[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          color: CommonColors.whiteColor,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                              color: CommonColors.whiteColor, fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
