import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FlowPage extends StatefulWidget {
  FlowPage({Key key}) : super(key: key);

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = _buildList();
    return Scaffold(
        appBar: CommonAppBar(
          title: "瀑布流",
        ),
        floatingActionButton: Text(
          "${currentIndex + 1}/${list.length}",
          style: TextStyle(
            fontSize: 34,
            color: CommonColors.redColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: PageView(
          children: list,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }

  List<Widget> _buildList() {
    return [
      MasonryGridView.count(
        crossAxisCount: 4, //横轴单元格数量
        itemCount: 22, //元素数量
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        itemBuilder: (context, i) {
          return _buildTile(i);
        },
        padding: EdgeInsets.all(8),
      ),
      GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4, //横向总共4个
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            /*
            pattern：
              由于repeatPattern存在，所有，高度是根据模式进行翻倍的，
              inverted:中心对称，
              mirrored:纵轴对称，
              same：完全复制；
             QuiltedGridTile参数：从左到右从上到下，主轴高度，纵轴高度；
             每个Tile代表一个item；
            */
            QuiltedGridTile(1, 3),
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 2),
            QuiltedGridTile(1, 1),

            QuiltedGridTile(2, 2), //长宽
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => _buildTile(index),
            childCount: 13),
      ),
      GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _buildTile(index),
        ),
      ),
      GridView.custom(
        gridDelegate: SliverStairedGridDelegate(
          crossAxisSpacing: 48,
          mainAxisSpacing: 24,
          startCrossAxisDirectionReversed: true,
          pattern: [
            StairedGridTile(0.5, 1),
            StairedGridTile(0.5, 3 / 4),
            StairedGridTile(1.0, 10 / 4),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _buildTile(index),
        ),
      ),
      AlignedGridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 20,
        itemBuilder: (context, index) {
          return _buildTile(index);
        },
      ),
    ];
  }

  Widget _buildTile(int index) {
    return Container(
      height: index * 5.0 + 4,
      color: CommonColors.getRandomColor(),
    );
  }
}
