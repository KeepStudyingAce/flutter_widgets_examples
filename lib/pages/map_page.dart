import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/routes/map_router.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Map",
        showLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: this._buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    return [
      _buildItem("Amap", () => MapRouter.goAmapPage(context)),
      _buildItem("BaiduMap", () => MapRouter.goBaiduMapPage(context)),
    ];
  }

  Widget _buildItem(String title, Function onClick) {
    return ListTile(
      key: ValueKey(title),
      tileColor: CommonColors.whiteColor,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onClick,
    );
  }
}
