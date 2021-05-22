import 'dart:math';

import 'package:flutter/material.dart';

class EnSignPage extends StatefulWidget {
  @override
  _EnSignPageState createState() => _EnSignPageState();
}

class _EnSignPageState extends State<EnSignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: MyCustomPainter(),
          size: Size(300, 200),
        ),
      ),
    );
  }
}


class MyCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width; // chiều rộng của lá cờ
    final double height = 2 * width / 3; // chiều cao của lá cờ bằng 2 / 3 chiều rộng
    final double r = width / 5; // bán kính đường tròn ngoại tiếp ngôi sao
    final Paint redPaint = Paint() // tạo paint màu đỏ để vẽ cờ đỏ
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTRB(0, 0, width, height),
        redPaint);
    final pointA = Offset(0, -r);
    final pointB = Offset(r * sin(72.toRadian()), -r * cos(72.toRadian()));
    final pointC = Offset(r * sin(36.toRadian()), r * cos(36.toRadian()));
    final pointD =
    Offset(-pointC.dx, pointC.dy); // đối xứng với C qua trục tung
    final pointE =
    Offset(-pointB.dx, pointB.dy); // đối xứng với B qua trục tung

    final Path path = Path()
      ..moveTo(pointA.dx, pointA.dy) // đưa ngòi bút đến điểm A
      ..lineTo(pointC.dx, pointC.dy) // vẽ 1 line từ A đến C
      ..lineTo(pointE.dx, pointE.dy) // vẽ 1 line từ C đến E
      ..lineTo(pointB.dx, pointB.dy) // vẽ 1 line từ E đến B
      ..lineTo(pointD.dx, pointD.dy) // vẽ 1 line từ B đến D
      ..close(); // vẽ 1 line từ D đến A tạo thành 1 hình khép kín

    final Paint yellowPaint = Paint() // tạo paint màu vàng để vẽ sao vàng
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // toạ độ tính toán của tâm ngôi sao
    final pointO = Offset(0, 0);

    // toạ độ thật của tâm ngôi sao
    final pointI = Offset(width / 2, height / 2);

    // vector tịnh tiến OI
    final translationVector = pointI - pointO;

    // thực hiện phép tịnh tiến cả Path
    final realPath = path.shift(translationVector);

    // vẽ lại realPath
    canvas.drawPath(realPath, yellowPaint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
extension NumberUtil on num {
  num toRadian() {
    return this * pi / 180;
  }
}