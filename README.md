# flutter_basic_chat_bubble

The puropose of this package is it to show customizable chat bubbles. You can customize the bubbles in certain ways. The bubbles can just display text messages. At the moment other data types are not possible. 

![Screenhot](https://github.com/rwbr/flutter_basic_chat_bubble/blob/main/img/demo_screen.png)

## Usage

### Set the dependency

```
dependencies:
  flutter_basic_chat_bubble: ^0.0.1
```

### Install

```
flutter pub get
```

### Import it

```dart
import 'package:flutter_basic_chat_bubble/flutter_basic_chat_bubble.dart';
```

### Use it

```dart
return Scaffold(
    body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
        return BasicChatBubble(
            message: messages[index],
            isMe: index % 2 ==
                0, // Every second bubble has the isMe flag set to true
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
);
```

For more details see the **example**.

## Properties

```dart
final BasicChatMessage message;
final bool isMe;
final Color backgroundColor;
final Color textColor;
final Color buttonColor;
final Widget buttonWidget;
final String buttonText;
```

