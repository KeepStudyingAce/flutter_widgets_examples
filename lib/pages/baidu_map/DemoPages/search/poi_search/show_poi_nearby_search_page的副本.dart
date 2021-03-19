import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import '../../../CustomWidgets/map_appbar.dart';
import '../../../CustomWidgets/map_base_page_state.dart';
import '../../../general/alert_dialog_utils.dart';
import '../../../CustomWidgets/input_box.dart';
import '../../../CustomWidgets/search_btn.dart';
import '../../../DemoPages/search/poi_search_params/show_poi_nearby_search_params_page.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

class ShowPOINearbySearchPage extends StatefulWidget {
  @override
  _ShowPOINearbySearchPageState createState() =>
      _ShowPOINearbySearchPageState();
}

class _ShowPOINearbySearchPageState
    extends BMFBaseMapState<ShowPOINearbySearchPage> {
  final _latController = TextEditingController(text: "40.049557");
  final _lonController = TextEditingController(text: "116.279295");
  final _keywordsController = TextEditingController(text: "小吃,酒店");
  final _radiusController = TextEditingController(text: "1000");

  BMFPoiNearbySearchOption _nearbySearchOption;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: BMFAppBar(
        title: "POI周边检索",
        onBack: () {
          Navigator.pop(context);
        },
        actions: [
          BMFSearchBtn(
            title: "详细参数",
            padding: EdgeInsets.only(left: 10, right: 10),
            onTap: () {
              _onTapParamsPage(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: generateMap(),
          ),
          _bottomSearchBar()
        ],
      ),
    );
  }

  /// 参数设置
  void _onTapParamsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ShowPOINearbySearchParamsPage(callBack: _searchParamsPageCallBack),
      ),
    );
  }

  /// 自定义参数回调
  void _searchParamsPageCallBack(BMFPoiNearbySearchOption option) {
    if (option.location != null) {
      _latController.text = "${option.location.latitude}";
      _lonController.text = "${option.location.longitude}";
    }

    if (option.keywords != null) {
      _keywordsController.text = option.keywords.join(",");
    }

    _nearbySearchOption = option;
  }

  /// 检索
  void _onTapSearch() async {
    /// 检索参数
    BMFCoordinate coords;
    if (_latController.text.isNotEmpty && _lonController.text.isNotEmpty) {
      double lat = double.parse(_latController.text);
      double lon = double.parse(_lonController.text);
      coords = BMFCoordinate(lat, lon);
    }

    List<String> keywords = _keywordsController.text.split(",").toList();

    int radius;
    if (_radiusController.text.isNotEmpty) {
      radius = int.parse(_radiusController.text);
    }
    BMFPoiNearbySearchOption option = BMFPoiNearbySearchOption(
        location: coords, keywords: keywords, radius: radius);

    /// 检索自定义参数
    if (_nearbySearchOption != null) {
      option.tags = _nearbySearchOption.tags;
      option.radius = _nearbySearchOption.radius;
      option.pageIndex = _nearbySearchOption.pageIndex;
      option.pageSize = _nearbySearchOption.pageSize;
      option.scope = _nearbySearchOption.scope;
      option.isRadiusLimit = _nearbySearchOption.isRadiusLimit;
      option.filter = _nearbySearchOption.filter;
    }

    /// 检索对象
    BMFPoiNearbySearch nearbySearch = BMFPoiNearbySearch();

    /// 发起检索
    bool result = await nearbySearch.poiNearbySearch(option);

    /// 检索回调
    nearbySearch.onGetPoiNearbySearchResult(
        callback: _onGetPoiNearbySearchResult);

    if (result) {
      print("发起检索成功");
    } else {
      print("发起检索失败");
    }
  }

  /// 检索回调
  void _onGetPoiNearbySearchResult(
      BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
    if (errorCode != BMFSearchErrorCode.NO_ERROR) {
      var error = "检索失败" + "errorCode:${errorCode.toString()}";
      showToast(context, error);
      print(error);
      return;
    }

    /// 检索结果标注
    List<BMFMarker> markers = [];
    for (BMFPoiInfo poiInfo in result.poiInfoList) {
      BMFMarker marker = BMFMarker(
          position: poiInfo.pt,
          title: poiInfo.name,
          icon: "resoures/icon_binding_point.png");
      markers.add(marker);
    }
    myMapController?.cleanAllMarkers();
    myMapController?.addMarkers(markers);
    myMapController?.setCenterCoordinate(markers[0].position, true);

    /// 检索结果 alert msg
    Map resultMap = result.toMap();
    Map firstPOIMap = resultMap["poiInfoList"][0];
    Map detailInfoMap = firstPOIMap["detailInfo"];
    resultMap.remove("poiInfoList");
    firstPOIMap.remove("detailInfo");
    resultMap.addAll(firstPOIMap);
    resultMap.addAll(detailInfoMap);

    List<String> alertMsgs = [];
    _nearbyResultMap.forEach((key, value) {
      String msg = value;
      if (key.contains(".")) {
        List keys = key.split(".");
        var subMap = resultMap;
        for (String subKey in keys) {
          if (subMap[subKey] is Map) {
            subMap = subMap[subKey];
          } else {
            msg += "${subMap[subKey]}";
          }
        }
      } else {
        msg += "${resultMap[key]}";
      }
      alertMsgs.add(msg);
    });

    String alertMsg = alertMsgs.join("\n");
    showSearchResultAlertDialog(context, alertMsg);
  }

  /// 底部搜索bar
  Widget _bottomSearchBar() {
    return SafeArea(
      child: Container(
        height: (35.0 * 4 + 10),
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    BMFInputBox(
                        controller: _latController,
                        title: "    纬度：",
                        placeholder: "输入纬度"),
                    BMFInputBox(
                        controller: _lonController,
                        title: "    经度：",
                        placeholder: "输入精度"),
                    BMFInputBox(
                        controller: _keywordsController,
                        title: "关键字：",
                        placeholder: "输入关键字"),
                    BMFInputBox(
                        controller: _radiusController,
                        title: "半径：",
                        placeholder: "输入半径"),
                  ],
                ),
              ),
            ),
            BMFSearchBtn(
              height: (35.0 * 3 + 5),
              title: "搜索",
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              onTap: _onTapSearch,
            )
          ],
        ),
      ),
    );
  }

  /// 检索结果 alert 数据
  Map<String, String> _nearbyResultMap = {
    "totalPOINum": "检索结果总数：",
    "totalPageNum": "总页数：",
    "curPOINum": "当前页的结果数：",
    "curPageIndex": "当前页的页数索引：",
    "name": "名称：",
    "pt.latitude": "纬度：",
    "pt.longitude": "经度：",
    "address": "地址：",
    "phone": "电话：",
    "uid": "UID：",
    "province": "省份：",
    "city": "城市：",
    "area": "行政区域：",
    "streetID": "街景图ID：",
    "hasDetailInfo": "是否有详细信息：",
    "distance": "距离中心点的距离：",
    "type": "类型：",
    "tag": "标签：",
    "naviLocation.latitude": "导航引导点坐标纬度：",
    "naviLocation.longitude": "导航引导点坐标经度：",
    "detailURL": "详情页URL：",
    "price": "商户的价格：",
    "openingHours": "营业时间：",
    "overallRating": "总体评分：",
    "tasteRating": "口味评分：",
    "serviceRating": "服务评分：",
    "environmentRating": "环境评分：",
    "facilityRating": "星级评分：",
    "hygieneRating": "卫生评分：",
    "technologyRating": "技术评分：",
    "imageNumber": "图片数目：",
    "grouponNumber": "团购数目：",
    "discountNumber": "优惠数目：",
    "commentNumber": "评论数目：",
    "favoriteNumber": "收藏数目：",
    "checkInNumber": "签到数目：",
  };
}
