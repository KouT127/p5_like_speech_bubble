import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextArea extends StatelessWidget {
  const TextArea({
    @required this.height,
    @required this.width,
    @required this.text,
    @required this.textColor,
  });

  final double height;
  final double width;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Container(
            width: 100,
            child: CustomPaint(
              painter: WhiteLine(),
            ),
          ),
        ),
        SizedBox(
          height: height,
          width: width,
          child: Transform(
            transform: Matrix4.skewX(-0.34),
            child: const ColoredBox(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Container(
            width: 100,
            child: CustomPaint(
              painter: BlackLine(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(2.5, 7.5, 0, 0),
          child: SizedBox(
            height: height - 15.0,
            width: width - 15.0,
            child: Transform(
              transform: Matrix4.skewX(-0.28),
              child: ColoredBox(
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WhiteLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawWhiteLine(canvas);
  }

  void drawWhiteLine(Canvas canvas) {
    final squarePath = Path();
    final whitePaint = Paint()
      ..strokeWidth = 1
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    squarePath.relativeMoveTo(5, -8);
    squarePath.relativeLineTo(-30, 22);
    squarePath.relativeLineTo(3, 15);
    squarePath.relativeLineTo(25, -10);

    final trianglePath = Path();
    trianglePath.relativeMoveTo(-5, 2);
    trianglePath.relativeLineTo(-8, -10);
    trianglePath.relativeLineTo(-28, 34);

    squarePath.close();
    trianglePath.close();

    canvas.drawPath(squarePath, whitePaint);
    canvas.drawPath(trianglePath, whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BlackLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawBlackLine(canvas);
  }

  void drawBlackLine(Canvas canvas) {
    final squarePath = Path();
    final paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    squarePath.relativeLineTo(-20, 12);
    squarePath.relativeLineTo(2, 10);
    squarePath.relativeLineTo(18, -8);

    final trianglePath = Path();

    trianglePath.relativeMoveTo(-8, 8);
    trianglePath.relativeLineTo(-5, -10);
    trianglePath.relativeLineTo(-20, 20);

    squarePath.close();
    trianglePath.close();

    canvas.drawPath(squarePath, paint);
    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
