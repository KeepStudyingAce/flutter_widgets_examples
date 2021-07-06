import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:like_button/like_button.dart';

class LikeButtonPage extends StatefulWidget {
  LikeButtonPage({Key key}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButtonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "文字特效",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LikeButton(
              likeBuilder: (bool isLiked) {
                return Icon(Icons.person);
              },
              likeCount: 520),
          LikeButton(
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.person,
                color: isLiked ? Colors.blue : Colors.grey,
              );
            },
            likeCount: 520,
            circleColor:
                CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
          ),
          LikeButton(
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.person,
                  color: isLiked ? Colors.blue : Colors.grey,
                );
              },
              likeCount: 520,
              circleColor:
                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Color(0xff33b5e5),
                dotSecondaryColor: Color(0xff0099cc),
              ),
              countBuilder: (int count, bool isLiked, String text) {
                var color = isLiked ? Colors.red : Colors.grey;
                Widget result;
                result = Text(
                  text,
                  style: TextStyle(color: color, fontSize: 20),
                );
                return result;
              },
              countDecoration: (child, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    child,
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "loves",
                      style: TextStyle(color: Colors.indigoAccent),
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
