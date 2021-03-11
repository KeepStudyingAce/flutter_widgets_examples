import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter/material.dart';

class FluidFillIconData {
  final List<ui.Path> paths;
  FluidFillIconData(this.paths);
}

/**
1、drawRect 用来绘制矩形，Flutter 提供了多种绘制矩形方法：
Rect.fromPoints 根据两个点(左上角点/右下角点)来绘制；
Rect.fromLTRB 根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离；
Rect.fromLTWH 根据设置左上角的点与矩形宽高来绘制；
Rect.fromCircle 最特殊，根据圆形绘制正方形；

2、drawRRect 绘制圆角矩形，Flutter 提供了多种绘制方法：
RRect.fromLTRBXY 前四个参数用来绘制矩形位置，剩余两个参数绘制固定 x/y 弧度；
RRect.fromLTRBR 前四个参数用来绘制矩形位置，最后一个参数绘制 Radius 弧度；
RRect.fromLTRBAndCorners 前四个参数用来绘制矩形位置，剩余四个可选择参数，根据需求设置四个角 Radius 弧度，可不同；
RRect.fromRectXY 第一个参数绘制矩形，可以用上面介绍的多种矩形绘制方式，剩余两个参数绘制固定 x/y 弧度；
RRect.fromRectAndRadius 第一个参数绘制矩形，可以用上面介绍的多种矩形绘制方式，最后一个参数绘制 Radius 弧度；
RRect.fromRectAndCorners第一个参数绘制矩形，可以用上面介绍的多种矩形绘制方式，剩余四个可选择参数，根据需求设置四个角 Radius 弧度，最为灵活。

3、drawPath 用来绘制路径，Flutter 提供了众多路径方法，几种常用的方法：
moveTo() 即从当前坐标点开始，不设置时默认为屏幕左上角位置；
lineTo() 即从起点绘制到设置的新的点位；
close() 即最后的点到起始点连接，但对于中间绘制矩形/弧等时最后不会相连；
reset() 即清空连线；
addRect() 添加矩形连线；
addArc(Rect oval, double startAngle, double sweepAngle) - 添加圆弧
addOval() 添加弧线，即贝塞尔(二阶)曲线 ； 添加圆
cubicTo() 添加弧线，即贝塞尔(三阶)曲线；
relativeMoveTo() 相对于移动到当前点位，小菜认为与 moveTo 相比整个坐标系移动；
relativeLineTo() 相对连接到当前点位，并将坐标系移动到当前点位；
 */
class FluidFillIcons {
  static final platform = FluidFillIconData([
    ui.Path()
      ..moveTo(0, -6)
      ..lineTo(10, -6),
    ui.Path()
      ..moveTo(5, 0)
      ..lineTo(-5, 0),
    ui.Path()
      ..moveTo(-10, 6)
      ..lineTo(0, 6),
  ]);
  static final window = FluidFillIconData([
    ui.Path()..addRRect(RRect.fromLTRBXY(-12, -12, -2, -2, 2, 2)),
    ui.Path()..addRRect(RRect.fromLTRBXY(2, -12, 12, -2, 2, 2)),
    ui.Path()..addRRect(RRect.fromLTRBXY(-12, 2, -2, 12, 2, 2)),
    ui.Path()..addRRect(RRect.fromLTRBXY(2, 2, 12, 12, 2, 2)),
  ]);
  static final arrow = FluidFillIconData([
    ui.Path()
      ..moveTo(-10, 6)
      ..lineTo(10, 6)
      ..moveTo(10, 6)
      ..lineTo(3, 0)
      ..moveTo(10, 6)
      ..lineTo(3, 12),
    ui.Path()
      ..moveTo(10, -6)
      ..lineTo(-10, -6)
      ..moveTo(-10, -6)
      ..lineTo(-3, 0)
      ..moveTo(-10, -6)
      ..lineTo(-3, -12),
  ]);
  static final user = FluidFillIconData([
    ui.Path()..arcTo(Rect.fromLTRB(-5, -16, 5, -6), 0, 1.9 * math.pi, true),
    ui.Path()..arcTo(Rect.fromLTRB(-10, 0, 10, 20), 0, -1.0 * math.pi, true),
  ]);
  static final home = FluidFillIconData([
    ui.Path()..addRRect(RRect.fromLTRBXY(-10, -2, 10, 10, 2, 2)),
    ui.Path()
      ..moveTo(-14, -2)
      ..lineTo(14, -2)
      ..lineTo(0, -16)
      ..close(),
  ]);
}
