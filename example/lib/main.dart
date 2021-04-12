import 'package:flutter/material.dart';
import 'package:flutter_basic_chat_bubble/flutter_basic_chat_bubble.dart';

void main() {
  runApp(BasicChatBubbleDemo());
}

class BasicChatBubbleDemo extends StatelessWidget {
  // Creating a list of sample Chat messages
  final List<BasicChatMessage> messages = [
    BasicChatMessage(
        peerUserName: 'User1',
        messageText: 'Awsome message!',
        timeStamp: '12:00'),
    BasicChatMessage(
        peerUserName: 'User1',
        messageText: 'Awsome message!',
        timeStamp: 'Yesterday'),
    BasicChatMessage(
        peerUserName: 'User1',
        messageText: 'Awsome message!',
        timeStamp: 'Tue'),
    BasicChatMessage(
        peerUserName: 'User1',
        messageText: 'Awsome message!',
        timeStamp: 'Mon'),
    BasicChatMessage(
      peerUserName: 'User1',
      messageText: 'Awsome message!',
      timeStamp: 'Sun',
    ),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Chat Bubble Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return BasicChatBubble(
              message: messages[index],
              isMe: index % 2 ==
                  0, // Every second bubble has the isMe flag set to true
              backgroundColor:
                  (index % 2 == 0 ? Colors.green[400] : Colors.blue)!,
              textColor: Colors.white,
              buttonWidget: index == messages.length - 1
                  ? InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.video_call,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        print('Button tapped $index');
                      })
                  : null,
              buttonText: 'Make a Call',
            );
          },
        ),
      ),
    );
  }
}
