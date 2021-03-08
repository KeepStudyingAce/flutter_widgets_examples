import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/placeholder/placeholder_image.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 4 : 2;

    return Container(
      child: GridView.count(
        crossAxisCount: columnCount,
        children: List.generate(20, (index) {
          return PlaceholderImage();
        }),
      ),
    );
  }
}
