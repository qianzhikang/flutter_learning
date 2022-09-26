import 'dart:math';

import 'package:flutter/material.dart';

class CakePage extends StatelessWidget {
  const CakePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自绘组件'),),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Cake([1.0, 2.0, 3.0, 9.0, 8.7, 2, 3, 5.9, 6.9, 9.9]),
        ),
    );
  }
}

class WheelPainter extends CustomPainter {
  List<double> doubleList;

  WheelPainter(this.doubleList);

  Paint getColoredPaint() {
    Paint paint = Paint();
    paint.color = getRandomColor();
    return paint;
  }

  Color getRandomColor({int r = 255, int g = 255, int b = 255, a = 255}) {
    if (r == 0 || g == 0 || b == 0) return Colors.black;
    if (a == 0) return Colors.white;
    return Color.fromARGB(
      a,
      r != 255 ? r : Random.secure().nextInt(r),
      g != 255 ? g : Random.secure().nextInt(g),
      b != 255 ? b : Random.secure().nextInt(b),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    double wheelSize = min(size.width, size.height) / 2;
    // doubleList为double数组长度
    int len = doubleList.length;
    // sum为数组求和结果
    double sum = doubleList.reduce((a, b) => a + b);
    Rect boundingRect = Rect.fromCircle(
        center: Offset(wheelSize, wheelSize), radius: wheelSize);
    // begin 记录画笔每次开始角度
    double begin = 0.0;
    for (int i = 0; i < len; i++) {
      // 每次画下标记所在位置的值占总和的份数换算
      canvas.drawArc(boundingRect, begin, (doubleList[i]/sum)*(2*pi), true, getColoredPaint());
      // 更新画笔开始位置
      begin = begin + (doubleList[i]/sum)*(2*pi);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;
}

class Cake extends StatelessWidget {
  List<double> nbElem;

  Cake(this.nbElem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: WheelPainter(nbElem),
    );
  }
}
