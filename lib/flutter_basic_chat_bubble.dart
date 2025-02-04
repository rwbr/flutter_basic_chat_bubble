library flutter_basic_chat_bubble;

import 'package:flutter/material.dart';
import './flutter_basic_chat_message.dart';

export './flutter_basic_chat_message.dart';

const int kTabletBreakpoint = 600;

class BasicChatBubble extends StatelessWidget {
  final BasicChatMessage? message;
  final bool isMe;
  final Color backgroundColor;
  final Color textColor;
  final Widget? buttonWidget;
  final String? buttonText;
  final bool showTriangle;
  final bool showDateAtTop;
  final EdgeInsets bubblePadding;

  BasicChatBubble(
      {this.message,
      this.isMe = false,
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white,
      this.buttonWidget,
      this.buttonText,
      this.showTriangle = true,
      this.showDateAtTop = true,
      this.bubblePadding = const EdgeInsets.all(10.0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: bubblePadding,
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Stack(children: [
            // Rechteck mit abgerundeten Ecken
            Container(
              width: isTablet(context)
                  ? MediaQuery.of(context).size.width * 0.4
                  : 300.0,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            message?.peerUserName ?? '',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        showDateAtTop
                            ? Text(
                                message?.timeStamp ?? '',
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                textAlign: TextAlign.end,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  this.buttonWidget != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Container(child: this.buttonWidget),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Flexible(
                                child: Text(
                                  buttonText ?? '',
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ])
                      : Text(message?.messageText ?? '',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal),
                          overflow: TextOverflow.visible,
                          softWrap: true),
                  this.showDateAtTop
                      ? Container()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            message?.timeStamp ?? '',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            textAlign: TextAlign.end,
                          ),
                        ),
                ],
              ),
            ),
            // Kleines Dreieck an die ChatBubble ansetzen. Je nach Richtung der Chat-Message
            // links oder rechts
            isMe
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: showTriangle
                        ? CustomPaint(
                            painter: ChatBubbleTriangle(isMe, backgroundColor),
                          )
                        : Container())
                : Positioned(
                    top: 0,
                    left: 0,
                    child: showTriangle
                        ? CustomPaint(
                            painter: ChatBubbleTriangle(isMe, backgroundColor),
                          )
                        : Container())
          ]),
        ],
      ),
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
  final Color backgroundColor;

  const ChatBubbleTriangle(this.isMe, this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = backgroundColor;

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
