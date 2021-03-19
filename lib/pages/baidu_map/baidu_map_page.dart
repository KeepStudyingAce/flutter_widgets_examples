import './CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;
import 'flutter_map_demo.dart';

import 'package:flutter/material.dart';

class BaiduMap extends StatefulWidget {
  @override
  _BaiduMapState createState() => _BaiduMapState();
}

class _BaiduMapState extends State<BaiduMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: BMFAppBar(
            title: '百度地图flutter插件Demo',
            isBack: true,
          ),
          body: FlutterBMFMapDemo()),
    );
  }
}
