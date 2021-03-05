import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class Matrix4AnimationPage extends StatefulWidget {
  Matrix4AnimationPage({Key key}) : super(key: key);

  @override
  _Matrix4AnimationPageState createState() => _Matrix4AnimationPageState();
}

class _Matrix4AnimationPageState extends State<Matrix4AnimationPage>
    with TickerProviderStateMixin {
  //动画一：补间动画
  AnimationController animationController;
  Animation animation;
  int currentIndex = 0;
  List<Widget> widgetList = [];
//动画二：父子（多个动画合并一起）动画
  TextEditingController _nameController, _pwController;

  Animation _animation, _childAnimation;
  AnimationController _animationController;
  //动画三：带延迟父子动画
  Animation _animationTitle, _animationTextField, _animationButton;
  AnimationController _animationController1;
  //动画四：动画中的子动画，父动画是按照X轴平移，子动画是上面的方块大小逐渐增大
  AnimationController animationController2;
  Animation parentAnimation;
  Animation childAnimation;

  double width;
  @override
  void initState() {
    //动画一：补间动画
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: -0.15).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    //动画二：父子（多个动画合并一起）动画
    _nameController = TextEditingController();
    _pwController = TextEditingController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    _childAnimation = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    // _animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reset();
    //   }
    // });
    //动画三：带延迟父子动画
    _animationController1 = AnimationController(
        vsync: this, duration: Duration(seconds: 2, milliseconds: 50));
    _animationTitle = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController1, curve: Curves.fastOutSlowIn));
    _animationTextField = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn)));
    _animationButton = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn)));
    // _animationController1.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController1.reset();
    //   }
    // });
    //动画四：动画中的子动画，父动画是按照X轴平移，子动画是上面的方块大小逐渐增大
    animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    parentAnimation = Tween(begin: -0.5, end: 0.0).animate(
        CurvedAnimation(parent: animationController2, curve: Curves.easeIn));
    childAnimation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController2, curve: Curves.easeIn));
    // animationController2.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController2.reset();
    //   }
    // });
    widgetList
      ..add(_buildHideButton())
      ..add(_buildParentAnimation())
      ..add(_buildDelayParentAnimation())
      ..add(_buildAnotherParentAnimation());
    super.initState();
    width = 370;
  }

  @override
  void dispose() {
    _animationController.dispose();
    animationController2.dispose();
    _animationController1.dispose();
    _pwController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Matrix4Animation",
      ),
      body: widgetList[currentIndex],
      floatingActionButton: _buildBtn(),
    );
  }

  //补间动画
  Widget _buildHideButton() {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Center(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                          child: Text('Buy'),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {}),
                      SizedBox(width: 10.0),
                      RaisedButton(
                          child: Text('Details'),
                          elevation: 7.0,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {})
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    animationController.forward();
                  },
                  onDoubleTap: () {
                    animationController.reverse();
                  },
                  child: Center(
                    child: Container(
                      color: Colors.lightBlue,
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 80.0,
                      transform: Matrix4.translationValues(
                          0.0, animation.value * width, 0.0),
                      child: Text("单击显示，双击隐藏"),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  //组合动画（父动画与子动画）
  Widget _buildParentAnimation() {
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Transform(
              transform:
                  Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
              child: AnimatedBuilder(
                animation: _childAnimation,
                builder: (BuildContext context, Widget child) {
                  return Container(
                    height: _childAnimation.value * 2,
                    width: _childAnimation.value * 2,
                    child: SafeArea(
                      child: ListView(
                        children: <Widget>[
                          const SizedBox(height: 80.0),
                          Center(
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 32.0),
                            ),
                          ),
                          const SizedBox(height: 80.0),
                          _buildTextField(_nameController, false, "name"),
                          _buildTextField(_pwController, true, "password"),
                          const SizedBox(height: 40.0),
                          ButtonBar(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {},
                                child: Text('login'),
                                color: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  Widget _buildDelayParentAnimation() {
    return AnimatedBuilder(
        animation: _animationController1,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 80.0),
                  Transform(
                    transform: Matrix4.translationValues(
                        _animationTitle.value * width, 0.0, 0.0),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 32.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80.0),
                  Transform(
                    transform: Matrix4.translationValues(
                        _animationTextField.value * width, 0.0, 0.0),
                    child: _buildTextField(_nameController, false, "name"),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        _animationTextField.value * width, 0.0, 0.0),
                    child: _buildTextField(_pwController, true, "password"),
                  ),
                  const SizedBox(height: 40.0),
                  Transform(
                      transform: Matrix4.translationValues(
                          _animationButton.value * width, 0.0, 0.0),
                      child: ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {},
                            child: Text('login'),
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextField(
      TextEditingController controller, bool obscureText, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              filled: true, labelText: labelText, fillColor: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAnotherParentAnimation() {
    return AnimatedBuilder(
      animation: parentAnimation,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(
                parentAnimation.value * width, 0.0, 0.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: childAnimation,
                    builder: (BuildContext context, Widget child) {
                      return Container(
                        color: Colors.lightBlue,
                        width: childAnimation.value * 2,
                        height: childAnimation.value,
                      );
                    },
                  ),
                  Container(
                    color: Colors.orange,
                    width: 200.0,
                    height: 100.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //FloatingActionButton自带heroTag属性，所以必须指定heroTag，否则会报同一个heroTag错
        FloatingActionButton(
          heroTag: "Increment0",
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          },
          tooltip: 'Decrement',
          child: Text("1"),
        ),
        SizedBox(width: 50),
        FloatingActionButton(
          heroTag: "Increment1",
          onPressed: () {
            setState(() {
              currentIndex = 1;
              _animationController.reset();
              _animationController.forward();
            });
          },
          tooltip: 'Increment',
          child: Text("2"),
        ),
        SizedBox(width: 50),
        FloatingActionButton(
          heroTag: "Increment2",
          onPressed: () {
            setState(() {
              currentIndex = 2;
              _animationController1.reset();
              _animationController1.forward();
            });
          },
          tooltip: 'Increment',
          child: Text("3"),
        ),
        SizedBox(width: 50),
        FloatingActionButton(
          heroTag: "Increment3",
          onPressed: () {
            setState(() {
              currentIndex = 3;
              animationController2.reset();
              animationController2.forward();
            });
          },
          tooltip: 'Increment',
          child: Text("4"),
        ),
      ],
    );
  }
}
