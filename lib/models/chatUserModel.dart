import 'package:flutter/cupertino.dart';


class ChatUser{
  String name;
  String messageText;
  String imageURL;
  String time;
  bool isMessageRead;
  ChatUser({@required this.name,@required this.messageText,@required this.imageURL,@required this.time, @required this.isMessageRead});
}