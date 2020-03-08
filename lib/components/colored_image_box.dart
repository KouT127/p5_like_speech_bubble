import 'package:flutter/material.dart';

class ColoredImageBox extends StatelessWidget {
  const ColoredImageBox({
    @required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 90,
      child: Transform(
        transform: Matrix4.skewX(.3)
          ..rotateX(.2)
          ..rotateY(-.4),
        child: ColoredBox(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 7, 5, 5),
                child: ColoredBox(
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
