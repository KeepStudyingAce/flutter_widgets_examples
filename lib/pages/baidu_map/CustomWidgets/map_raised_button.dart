import 'package:flutter/material.dart';
import '../constants.dart';

class BMFRaisedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const BMFRaisedButton({Key key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: Color(int.parse(Constants.btnColor)),
      textColor: Colors.white,
      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      onPressed: onPressed,
    );
  }
}

class BMFRaisedVisibleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool visible;

  const BMFRaisedVisibleButton(
      {Key key, this.title, this.onPressed, this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (visible) {
      return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Color(int.parse(Constants.btnColor)),
        textColor: Colors.white,
        visualDensity: VisualDensity(horizontal: 0, vertical: -2),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: onPressed,
      );
    } else {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }
}
