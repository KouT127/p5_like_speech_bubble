import 'package:flutter/material.dart';

import 'components/speech_bubble.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc11526),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SpeechBubble(
              text: 'ピンク',
              imageColor: Colors.pinkAccent.withOpacity(.9),
            ),
            SpeechBubble(
              text: '紫',
              imageColor: Colors.purple.withOpacity(.9),
            ),
            SpeechBubble(
              text: '青',
              imageColor: Color(0xff0017a8),
            ),
            SpeechBubble(
              text: '黄',
              imageColor: Color(0xfffff116),
            ),
            SpeechBubble(
              text: 'オレンジ',
              imageColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
