import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';

class ConstConfig {
  ///配置您申请的apikey，在此处配置之后，可以在初始化[AMapWidget]时，通过`apiKey`属性设置
  ///
  ///注意：使用[AMapWidget]的`apiKey`属性设置的key的优先级高于通过Native配置key的优先级，
  ///使用[AMapWidget]的`apiKey`属性配置后Native配置的key将失效，请根据实际情况选择使用
  static const AMapApiKey amapApiKeys = AMapApiKey(
      androidKey: 'd978a1a4af8bda0e2d575595bbb1682a',
      iosKey: '5f7d0c2f72d64a45ac82f4abe45c22b6');
}
