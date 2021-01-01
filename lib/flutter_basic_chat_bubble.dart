library flutter_basic_chat_bubble;

import 'package:flutter/material.dart';
import './flutter_basic_chat_message.dart';

export './flutter_basic_chat_message.dart';

const int kTabletBreakpoint = 600;

class BasicChatBubble extends StatelessWidget {
  BasicChatMessage message;
  bool isMe;
  Color peerColor;
  Color myColor;
  Widget buttonWidget;
  String buttonText;
  ValueChanged onTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      // Festlegung der Breite des Containers bestimmt die Breite der ChatBubble
      width:
          isTablet(context) ? MediaQuery.of(context).size.width * 0.4 : 300.0,
      // Der Stack bildet die Form der ChatBubble.
      child: Stack(children: [
        // Rechteck mit abgerundeten Ecken
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color: isMe ? myColor : peerColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      message.peerUserName,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      message.timeStamp.toString(),
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              this.buttonWidget != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Container(
                            child:
                                InkWell(child: this.buttonWidget, onTap: () {}),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Text(
                            buttonText,
                            style: TextStyle(color: Colors.white),
                          ),
                        ])
                  : Text(
                      message.messageText,
                      style: TextStyle(color: Colors.white),
                    )
            ],
          ),
        ),
        // Kleines Dreieck an die ChatBubble ansetzen. Je nach Richtung der Chat-Message
        // links oder rechts
        isMe
            ? Positioned(
                top: 0,
                right: 0,
                child: CustomPaint(
                  painter: ChatBubbleTriangle(isMe),
                ))
            : Positioned(
                top: 0,
                left: 0,
                child: CustomPaint(
                  painter: ChatBubbleTriangle(isMe),
                ))
      ]),
    );
  }

  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < kTabletBreakpoint) {
      return false;
    }
    return true;
  }
}

class ChatBubbleTriangle extends CustomPainter {
  final bool isMe;

  const ChatBubbleTriangle(this.isMe);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = isMe ? Colors.blue : Colors.green[400];

    var path = Path();
    path.lineTo(-10, 0);
    path.lineTo(0, 10);
    path.lineTo(10, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
