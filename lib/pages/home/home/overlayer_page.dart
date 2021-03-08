/**
 *
 *1、 overlay组件能够让我们在当前页面上层覆盖一层新的组件
 * 通过 Overlay.of(context) 我们能够获得最近的root的OverlayState
 * 通过 overlayState.insert(overlayEntry)我们能够在当前页面上覆盖一层widget
 * 通过 overlayEntry.remove()能够移除掉覆盖层的overlayEntry.
 * 当add多个overlayEntry的时候，先被add的会在下面，后被add的会在上面
 *
 * 虽然我们一般都用[WidgetsApp]or[MaterialApp]中[Navigator]创建出来的Overlay
 * 但是你也可以使用Overlay小部件，自定义Overlay。
 * 
 * 2、如果你的叠加层是完全不透明而且能沾满整个屏幕的话
 * 使用opaque：true 能够跳过构建原本的widget tree从而提升性能
 * 请通过注释opaque体验它的效果
 *
 * 如果就算这个叠层挡住了下面的widget了，但是你还是希望渲染下面的组件
 * 使用maintainState：true 能够强制渲染下方的widget，这个属性很昂贵，谨慎使用
 *
 * 如果你想改变叠加层的状态
 * 请在状态改变后使用overlayEntry.markNeedsBuild()它将会在下一帧重新rebuild
 * 而不是setState()
 */
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class OverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Overlay",
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyContainer(),
        );
      }),
      floatingActionButton: Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "showOverlay1",
              child: Icon(Icons.fiber_smart_record),
              onPressed: () => showOverlay1(context),
            ),
            FloatingActionButton(
              heroTag: "showOverlay2",
              child: Icon(Icons.fiber_smart_record_outlined),
              onPressed: () => showOverlay2(context),
            ),
          ],
        );
      }),
    );
  }

  showOverlay1(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.pinkAccent,
        ),
      );
    });
    OverlayEntry overlayEntry2 = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: 50.0,
          width: 100.0,
          color: Colors.tealAccent,
        ),
      );
    });

    overlayState.insert(overlayEntry);
    overlayState.insert(overlayEntry2);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
    overlayEntry2.remove();
  }

  showOverlay2(BuildContext context) async {
    Color color = Colors.pinkAccent;

    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Opacity(
            opacity: 0.5,
            child: Scaffold(
              body: Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: color,
                ),
              ),
            ),
          );
        });

    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 2));
    color = Colors.tealAccent;
    overlayEntry.markNeedsBuild();
    await Future.delayed(Duration(seconds: 2));
    overlayEntry.remove();
  }
}

class MyContainer extends StatefulWidget {
  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openOverlay,
      child: Container(
        alignment: Alignment.center,
        height: 200,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }

  void openOverlay() {
    OverlayState overlayState = Overlay.of(context);
    final RenderBox box = context.findRenderObject();
    final Offset target = box.localToGlobal(box.size.center(Offset.zero));
    final height = 100.0;
    final width = 100.0;
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: target.dy - height / 2,
        left: target.dx - width / 2,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: Material(child: Text('${target.toString()}')),
        ),
      );
    });
    overlayState.insert(overlayEntry);
    Future.delayed(Duration(seconds: 1)).then((_) {
      overlayEntry.remove();
    });
  }
}
