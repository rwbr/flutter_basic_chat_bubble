/// The [BasicChatMessage] class represents a single message, that forms
/// the content of a [BasicChatBubble]. This object has the following properties:
/// String [peerUserName] containes the name of the peer user (sender or receiver of message)
/// String [ownUserName] contains the own user name
/// String [messageText] contains the text of the message
/// DateTime [timeStamp] is the date/time of the message was sent
class BasicChatMessage {
  String peerUserName;
  String ownUserName;
  String messageText;
  String timeStamp;

  BasicChatMessage(
      {this.peerUserName, this.ownUserName, this.messageText, this.timeStamp});
}
