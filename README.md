# flutter_basic_chat_bubble

![Repo Card](https://github.com/rwbr/flutter_basic_chat_bubble/blob/main/img/github-repo-card.png)

The puropose of this package is it to show customizable chat bubbles. You can customize the bubbles in certain ways. The bubbles can just display text messages. At the moment other data types are not possible. 

![Screenhot](https://github.com/rwbr/flutter_basic_chat_bubble/blob/main/img/demo_screen.png)

## Usage

### Set the dependency

```
dependencies:
  flutter_basic_chat_bubble: ^0.2.0+2
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
final Widget buttonWidget;
final String buttonText;
```

### message

The property **message** contains an object representing the content of the message. It's defined as:

```dart
/// The [BasicChatMessage] class represents a single message, that forms
/// the content of a [BasicChatBubble]. This object has the following properties:
/// String [peerUserName] containes the name of the peer user (sender or receiver of message)
/// String [ownUserName] contains the own user name
/// String [messageText] contains the text of the message
/// DateTime [timeStamp] is the date/time of the message was sent
class BasicChatMessage {
  String peerUserName;
  String messageText;
  String timeStamp;

  BasicChatMessage({this.peerUserName, this.messageText, this.timeStamp});
}
```

### isMe

This parameter indicates, that the user of the app is the sender of the message. It determines the position of the bubble: 

* _true_: **right aligned** chat bubble 
* _false_: **left aligned** chat bubble 

### backgroundColor

This property defines the background color of the chat bubble.

### textColor

With this property you can set the color of the text elements of the chat bubble.

### Embedding a button in the chat bubble

In some cases it might be useful to embed a button inside the chat bubble. Imagin a messenger app with a video or phone call functionality. 

![Embedded button](https://github.com/rwbr/flutter_basic_chat_bubble/blob/main/img/chat_bubble_with_button.png)

This can be done by specifying a widget for that purpose in the **buttonWidget** and the **buttonText**  parameters.

### buttonWidget

Here you specify a widget, that should be used as the button. Usually you would use an InkWell widget to make it tappable.

Example:

```dart
InkWell(
    child: CircleAvatar(
        backgroundColor: Colors.red,
        child: Icon(
            Icons.video_call,
            color: Colors.white,
        ),
    ),
    onTap: () {
        print('Button tapped $index');
    }
)
```

### buttonText

This parameter defines the text placed right of the button, replacing the message body. 