import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

//抽奖概念
class LotteryPage extends StatefulWidget {
  LotteryPage({Key key}) : super(key: key);

  @override
  _LotteryPageState createState() => _LotteryPageState();
}

class _LotteryPageState extends State<LotteryPage> {
  SimpleLotteryController controller = SimpleLotteryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "抽奖",
      ),
      body: Center(
          child: SimpleLotteryWidget(
        controller: controller,
        onPress: () {
          controller.start(6);
        },
      )),
    );
  }
}

//抽奖数据模型
class SimpleLotteryValue {
  SimpleLotteryValue(
      {this.target = 0, this.isFinish = false, this.isPlaying = false});

  /// 中奖目标

  int target = 0;

  bool isPlaying = false;

  bool isFinish = false;

  SimpleLotteryValue copyWith({
    int target = 0,
    bool isPlaying = false,
    bool isFinish = false,
  }) {
    return SimpleLotteryValue(
        target: target, isFinish: isFinish, isPlaying: isPlaying);
  }

  @override
  String toString() {
    return "target : $target , isPlaying : $isPlaying , isFinish : $isFinish";
  }
}

// 抽奖控制器
class SimpleLotteryController extends ValueNotifier {
  SimpleLotteryController() : super(SimpleLotteryValue());

  /// 开启抽奖
  /// [target] 中奖目标
  void start(int target) {
// 九宫格抽奖里范围为0~8

    assert(target >= 0 && target <= 8);

    if (value.isPlaying) {
      return;
    }

    value = value.copyWith(target: target, isPlaying: true);
  }

  void finish() {
    value = value.copyWith(isFinish: true);
  }
}

//抽奖组件
class SimpleLotteryWidget extends StatefulWidget {
  final SimpleLotteryController controller;

  final Function onPress;

  SimpleLotteryWidget({Key key, @required this.controller, this.onPress});

  @override
  _SimpleLotteryWidgetState createState() => _SimpleLotteryWidgetState();
}

class _SimpleLotteryWidgetState extends State<SimpleLotteryWidget>
    with TickerProviderStateMixin {
  Animation _selectedIndexTween;

  AnimationController _startAnimateController;

  int _currentSelect = -1;

  int _target = 0;

  /// 旋转的圈数

  final int repeatRound = 6;

  VoidCallback _listener;

  /// 选中下标的映射

  final Map _selectMap = {0: 0, 1: 3, 2: 6, 3: 7, 4: 8, 5: 5, 6: 2, 7: 1};

  _SimpleLotteryWidgetState() {
    _listener = () {
// 开启抽奖动画
      if (widget.controller.value.isPlaying) {
        _startAnimateController.reset();

        _target = widget.controller.value.target;

        _selectedIndexTween = _initSelectIndexTween(_target);

        _startAnimateController.forward();
      }
    };
  }

  /// 初始化tween
  /// [target] 中奖的目标

  Animation _initSelectIndexTween(int target) =>
      StepTween(begin: 0, end: repeatRound * 8 + target).animate(
          CurvedAnimation(
              parent: _startAnimateController, curve: Curves.easeInOutSine));

  @override
  void initState() {
    _startAnimateController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    _selectedIndexTween = _initSelectIndexTween(_target);
// 动画监听
    _startAnimateController.addListener(() {
// 更新选中的下标
      setState(() {
        _currentSelect = _selectMap[_selectedIndexTween.value % 8];
        if (_startAnimateController.isCompleted) {
          widget.controller.finish();
        }
      });
    });

// 控制监听
    widget.controller.addListener(_listener);
    super.initState();
  }

  @override
  void deactivate() {
    widget.controller.removeListener(_listener);
    super.deactivate();
  }

  @override
  void dispose() {
    _startAnimateController.dispose();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
        itemBuilder: (context, index) {
          if (index != 4) {
            return Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    color: index == _currentSelect ? Colors.blue : Colors.amber,
                    child: Text(
                        _selectMap.values.toList().indexOf(index).toString()),
                  ),
                ],
              ),
            );
          }

          return GestureDetector(
            onTap: () => widget.onPress(),
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Text("开始抽奖"),
            ),
          );
        },
      ),
    );
  }
}
