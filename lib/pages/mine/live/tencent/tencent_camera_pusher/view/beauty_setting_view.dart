import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';

const beautyKind = {
  "美颜": [
    {"title": "美颜(光滑)"},
    {"title": "美颜(自然)"},
    {"title": "美颜(P图)"},
    {"title": "美白"},
    {"title": "红润"},
    {"title": "大眼"},
    {"title": "瘦脸"},
    {"title": "V脸"},
    {"title": "下巴"},
    {"title": "短脸"},
    {"title": "瘦鼻"},
    {"title": "亮眼"},
    {"title": "白牙"},
    {"title": "去皱"},
    {"title": "祛眼袋"},
    {"title": "祛法令纹"},
    {"title": "发际线"},
    {"title": "眼距"},
    {"title": "眼角"},
    {"title": "嘴形"},
    {"title": "鼻翼"},
    {"title": "鼻子位置"},
    {"title": "嘴唇厚度"},
    {"title": "脸型"},
  ],
  "滤镜": [
    {"title": "清除"},
    {"title": "白皙"},
    {"title": "标准"},
    {"title": "自然"},
    {"title": "樱红"},
    {"title": "云裳"},
    {"title": "纯真"},
    {"title": "白兰"},
    {"title": "元气"},
    {"title": "超脱"},
    {"title": "香氛"},
    {"title": "美白"},
    {"title": "浪漫"},
    {"title": "清新"},
    {"title": "唯美"},
    {"title": "粉嫩"},
    {"title": "怀旧"},
    {"title": "蓝调"},
    {"title": "清凉"},
    {"title": "日系"},
  ],
  "动效": [
    {"title": "无动效"},
    {"title": "Boom"},
  ],
  "美妆": [
    {"title": "无动效"},
    {"title": "原宿复古"},
  ],
  "手势": [
    {"title": "无动效"},
    {"title": "皮卡丘"},
  ],
  "扣背": [
    {"title": "无动效"},
    {"title": "AI扣背"},
  ],
  "绿幕": [
    {"title": "无动效"},
    {"title": "Good Luck"},
  ],
};

class BeautySettingView extends StatefulWidget {
  BeautySettingView({Key key}) : super(key: key);

  @override
  _BeautySettingState createState() => _BeautySettingState();
}

class _BeautySettingState extends State<BeautySettingView>
    with SingleTickerProviderStateMixin {
  TabController _bottomController;
  int currentIndex = 0;
  int subIndex = 0;
  double sliderValue = 0;
  List<Map<String, dynamic>> beautyList = [];
  @override
  void initState() {
    _bottomController = TabController(
        length: beautyKind.length, initialIndex: currentIndex, vsync: this);
    _bottomController.addListener(() {
      if (_bottomController.indexIsChanging) {
        setState(() {
          currentIndex = _bottomController.index;
          subIndex = 0;
          beautyList = beautyKind[beautyKind.keys.toList()[currentIndex]];
        });
      }
    });
    beautyList = beautyKind[beautyKind.keys.toList()[currentIndex]];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConfig.iphoneXBottomHeight(context) +
          ([0, 1].contains(currentIndex) ? 160 : 110),
      color: CommonColors.transparent,
      padding: EdgeInsets.only(
        bottom: AppConfig.iphoneXBottomHeight(context),
      ),
      width: AppConfig.screenWidth(context),
      child: Column(
        children: [
          [0, 1].contains(currentIndex)
              ? Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: sliderValue,
                        onChanged: (data) {
                          setState(() {
                            sliderValue = data;
                          });
                        },
                        onChangeStart: (data) {
                          print('start:$data');
                        },
                        onChangeEnd: (data) {
                          print('end:$data');
                        },
                        min: 0,
                        max: 10,
                        divisions: null,
                        label: '$sliderValue',
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars}';
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: CommonColors.whiteColor,
                      child: Text(
                        sliderValue.toStringAsFixed(0),
                        style: TextStyle(
                            fontSize: 14, color: CommonColors.blackColor),
                      ),
                    )
                  ],
                )
              : SizedBox(height: 10),
          SizedBox(
            width: AppConfig.screenWidth(context),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: beautyList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> currentItem = beautyList[index];
                bool isSel = subIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      subIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          color: CommonColors.whiteColor,
                        ),
                        Text(
                          currentItem["title"],
                          style: TextStyle(
                            fontSize: 13,
                            color: isSel
                                ? CommonColors.tencentGreenColor
                                : CommonColors.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: AppConfig.screenWidth(context),
            height: 50,
            color: CommonColors.black30Color,
            alignment: Alignment.center,
            child: TabBar(
              tabs: beautyKind.keys.map((tab) {
                bool isSel =
                    beautyKind.keys.toList().indexOf(tab) == currentIndex;
                return Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isSel
                            ? CommonColors.tencentGreenColor
                            : CommonColors.transparent),
                    child: Text(tab),
                  ),
                );
              }).toList(),
              labelPadding: EdgeInsets.all(12),
              controller: _bottomController,
              labelColor: CommonColors.whiteColor,
              unselectedLabelColor: CommonColors.whiteColor,
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
              ),
              indicator: null,
              indicatorWeight: 0.01,
              isScrollable: true,
            ),
          ),
        ],
      ),
    );
  }
}
