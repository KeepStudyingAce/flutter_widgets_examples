import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/utils/common_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_widgets_example/widgets.dart/self_rect_swiper_pagination_builder.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

const imageHeight = 200.0;

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Swiper",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildNomarlSwiper(),
            SizedBox(height: 10),
            _buildStackSwiper(),
            SizedBox(height: 10),
            _buildScaleSwiper(),
            SizedBox(height: 10),
            _buildTinderSwiper(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildNomarlSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CommonUtils.getWidget("$index.jpg");
        },
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: RectSwiperPaginationBuilder(
            size: Size(16, 3),
            activeSize: Size(16, 3),
            space: 0,
            color: CommonColors.inactiveColor,
            activeColor: CommonColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        loop: true,
        onIndexChanged: (index) {
          print("$index");
        },
        onTap: (int index) {
          print("$index");
        },
      ),
    );
  }

  Widget _buildStackSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CommonUtils.getWidget("${7 + index}.jpg");
        },
        layout: SwiperLayout.STACK,
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        itemHeight: imageHeight,
        itemWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: FractionPaginationBuilder(
            color: CommonColors.inactiveColor,
            activeColor: CommonColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        viewportFraction: 1,
        scale: 1,
        loop: true,
        onIndexChanged: (index) {
          print("$index");
        },
        onTap: (int index) {
          print("$index");
        },
      ),
    );
  }

  //自定义指示器
  Widget _buildScaleSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CommonUtils.getWidget("${3 + index}.jpg");
        },
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: SelfRectSwiperPaginationBuilder(
            size: Size(16, 3),
            activeSize: Size(16, 3),
            space: 0,
            color: CommonColors.inactiveColor,
            activeColor: CommonColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        viewportFraction: 0.7,
        scale: 0.7,
        loop: true,
        onIndexChanged: (index) {
          print("$index");
        },
        onTap: (int index) {
          print("$index");
        },
      ),
    );
  }

  Widget _buildTinderSwiper() {
    double imageWidth = AppConfig.screenWidth(context);
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CommonUtils.getWidget("${5 + index}.jpg");
        },
        layout: SwiperLayout.TINDER,
        itemCount: 5,
        containerHeight: imageHeight,
        containerWidth: imageWidth,
        itemHeight: imageHeight,
        itemWidth: imageWidth,
        pagination: new SwiperPagination(
          margin: EdgeInsets.only(bottom: 10),
          builder: DotSwiperPaginationBuilder(
            activeSize: 10,
            space: 2,
            color: CommonColors.inactiveColor,
            activeColor: CommonColors.whiteColor,
          ),
        ),
        control: null,
        duration: 1000,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        loop: true,
        onIndexChanged: (index) {
          print("$index");
        },
        onTap: (int index) {
          print("$index");
        },
      ),
    );
  }
}
