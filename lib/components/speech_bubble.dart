import 'package:flutter/material.dart';
import 'package:flutter_app/components/colored_image_box.dart';
import 'package:flutter_app/components/text_area.dart';

class SpeechBubble extends StatelessWidget {
  const SpeechBubble({
    Key key,
    @required this.text,
    @required this.imageColor,
    Color textColor = Colors.white,
  })  : this.textColor = textColor,
        super(key: key);

  final String text;
  final Color textColor;
  final Color imageColor;

  @override
  Widget build(BuildContext context) {
    final height = 60.0;
    final width = 250.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          ColoredImageBox(
            color: imageColor,
          ),
          SizedBox(width: 15),
          TextArea(
            height: height,
            width: width,
            text: text,
            textColor: textColor,
          )
        ],
      ),
    );
  }
}
