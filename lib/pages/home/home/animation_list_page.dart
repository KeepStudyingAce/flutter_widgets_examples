import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/routes/animation_router.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class AnimationListPage extends StatefulWidget {
  AnimationListPage({Key key}) : super(key: key);

  @override
  _AnimationListPageState createState() => _AnimationListPageState();
}

class _AnimationListPageState extends State<AnimationListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "AnimationListPage",
      ),
      body: ListView(
        children: [
          _buildItem("FlipText", () => AnimationRouter.goFlipTextPage(context)),
          _buildItem("AnimatedContainer",
              () => AnimationRouter.goAnimatedContainerPage(context)),
          _buildItem("AnimatedCrossFade",
              () => AnimationRouter.goAnimatedCrossFadePage(context)),
          _buildItem("HideBottomBar",
              () => AnimationRouter.goHideBottomBarPage(context)),
          _buildItem("Spinkit", () => AnimationRouter.goSpinkitPage(context)),
          _buildItem("AnimatedBuild",
              () => AnimationRouter.goAnimatedBuildPage(context)),
          _buildItem("Matrix4Animation",
              () => AnimationRouter.goMatrix4AnimationPage(context)),
          _buildItem("直播点赞动画",
              () => AnimationRouter.goLiveFavorAnimationPage(context)),
        ],
      ),
    );
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
