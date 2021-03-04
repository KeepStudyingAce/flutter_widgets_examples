import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/utils/common_util.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:flutter_widgets_example/widgets.dart/drag_sort_view.dart';

class DragSortPage extends StatefulWidget {
  DragSortPage({Key key}) : super(key: key);

  @override
  _DragSortPageState createState() => _DragSortPageState();
}

class _DragSortPageState extends State<DragSortPage> {
  List<ImageBean> imageList = List();
  int moveAction = MotionEvent.actionUp;
  bool _canDelete = false;
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    imageList = List.generate(9, (index) {
      String url = "$index.jpg";
      return ImageBean(
        originPath: url,
        middlePath: url,
        thumbPath: url,
        originalWidth: index == 0 ? 264 : null,
        originalHeight: index == 0 ? 258 : null,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'DragSortPage',
        rightButtons: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _init();
                });
              }),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Text("长按拖动图片顺序以及删除："),
          DragSortView(
            imageList,
            space: 5,
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              ImageBean bean = imageList[index];
              return CommonUtils.getWidget(bean.thumbPath);
            },
            initBuilder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  ToastUtil.showSnackBar(context, "选择图片");
                },
                child: Container(
                  color: CommonColors.separatorColor,
                  child: Center(
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              );
            },
            onDragListener: (MotionEvent event, double itemWidth) {
              switch (event.action) {
                case MotionEvent.actionDown:
                  moveAction = event.action;
                  setState(() {});
                  break;
                case MotionEvent.actionMove:
                  double x = event.globalX + itemWidth;
                  double y = event.globalY + itemWidth;
                  double maxX = MediaQuery.of(context).size.width - 1 * 100;
                  double maxY = MediaQuery.of(context).size.height - 1 * 100;
                  print('maxX: $maxX, maxY: $maxY, x: $x, y: $y');
                  if (_canDelete && (x < maxX || y < maxY)) {
                    setState(() {
                      _canDelete = false;
                    });
                  } else if (!_canDelete && x > maxX && y > maxY) {
                    setState(() {
                      _canDelete = true;
                    });
                  }
                  break;
                  break;
                case MotionEvent.actionUp:
                  moveAction = event.action;
                  if (_canDelete) {
                    setState(() {
                      _canDelete = false;
                    });
                    return true;
                  } else {
                    setState(() {});
                  }
                  break;
              }
              return false;
            },
          ),
        ],
      ),
      floatingActionButton: moveAction == MotionEvent.actionUp
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(_canDelete ? Icons.delete : Icons.delete_outline),
            ),
    );
  }
}
