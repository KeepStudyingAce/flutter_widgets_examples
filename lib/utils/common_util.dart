import 'package:flutter/material.dart';

class CommonUtils {
  static String getImgPath(String name) {
    return 'lib/assets/$name';
  }

  static Widget getWidget(String url) {
    if (url.startsWith('http')) {
      //return CachedNetworkImage(imageUrl: url, fit: BoxFit.cover);
      return Image.network(url, fit: BoxFit.cover);
    }
    return Image.asset(getImgPath(url), fit: BoxFit.cover);
  }
}
