import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:application_de_supervision/models/conversationModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'conversation_list_item.dart';
class ChatItem extends StatefulWidget {

  ChatItem({Key key,}): super(key: key);

  @override
  State<StatefulWidget> createState() => ChatItemState();

}

class ChatItemState extends State<ChatItem> {
  //final List<Conversation> conversations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: serviceConversations.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        Conversation c = serviceConversations[index];
        ChatMessage lastMessage =
        c.chatMessages[c.chatMessages.length - 1];
        print(c.runtimeType);
        return ConversationListItem(
          name: c
              .description, //the participants of this current conversation
          messageText: lastMessage.senderName +
              ": " +
              lastMessage.message,
          imageUrl: "https://picsum.photos/200",
          time: lastMessage.timestamp,
          onClickFunction: () {
            //give the selected conversation as argument
            Get.toNamed("/chatDetail", arguments: {
              "currentConversation": c,
              "description": c.description,
              "index": index
            }).then((value) {
              getConversations();
              print('INSIDE SET STATE of chat_item');
              setState((){});
            });
          },
        );
      },
    );
  }
}
