import 'package:flutter/material.dart';
import 'package:flutter_basic_chat_bubble/flutter_basic_chat_bubble.dart';

void main() {
  runApp(BasicChatBubbleDemo());
}

class BasicChatBubbleDemo extends StatelessWidget {
  final List<BasicChatMessage> messages = [
    BasicChatMessage(
        peerUserName: 'User1',
        ownUserName: 'My name',
        messageText: 'Awsome message!',
        timeStamp: '12:00'),
    BasicChatMessage(
        peerUserName: 'User1',
        ownUserName: 'My name',
        messageText: 'Awsome message!',
        timeStamp: 'Yesterday'),
    BasicChatMessage(
        peerUserName: 'User1',
        ownUserName: 'My name',
        messageText: 'Awsome message!',
        timeStamp: 'Tue'),
    BasicChatMessage(
        peerUserName: 'User1',
        ownUserName: 'My name',
        messageText: 'Awsome message!',
        timeStamp: 'Mon'),
    BasicChatMessage(
      peerUserName: 'User1',
      ownUserName: 'My name',
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return BasicChatBubble(
              message: messages[index],
              isMe: index % 2 == 0,
              backgroundColor: index % 2 == 0 ? Colors.green[400] : Colors.blue,
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
