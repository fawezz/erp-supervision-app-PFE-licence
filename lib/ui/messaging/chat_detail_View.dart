import 'package:application_de_supervision/app/designConstants.dart';
import 'package:application_de_supervision/app/sharedPrefsService.dart';
import 'package:application_de_supervision/app/stompService.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:application_de_supervision/models/conversationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'chat_detail_ViewModel.dart';
import 'package:get/get.dart';

class ChatDetailView extends StatelessWidget {
  ChatDetailView({Key key}) : super(key: key);


  final messageController = TextEditingController();
  final scrollController = ScrollController();
  //tefinal r = Navigator.of(Get.context).popAndPushNamed("/chat");

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });


    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(Get.arguments["description"]),
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Get.back();
            },),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: appBarColor
            ),),
        ),
        body: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 19),
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: "Ecrire un message...",
                          hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                          border: InputBorder.none,
                        ),

                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () async {
                        if(!messageController.text.isBlank){
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          model.newMessage =
                              ChatMessage(senderId: prefs.getInt("idUser"), senderName: prefs.getString("firstName"),
                                  message: messageController.text, description: Get.arguments["description"],
                                  participantsIds: model.currentConv.participantsIds);
                          model.sendMessage();
                          messageController.clear();
                          scrollController.jumpTo(scrollController.position.maxScrollExtent);
                        }
                        //messageController.value
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.hardEdge,
                children: <Widget>[
                  model.currentConv.chatMessages == null ?Container() :ListView.builder(
                      controller: scrollController,
                      //physics: BouncingScrollPhysics(),      //if it bounces then it wont scroll to the endd initially
                      itemCount: model.currentConv.chatMessages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                          child: Align(
                              alignment: (model.currentConv.chatMessages[index].senderId != SharedPrefsSerivce.currentUserId
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (model.currentConv.chatMessages[index].senderId != SharedPrefsSerivce.currentUserId
                                      ? Colors.grey.shade200
                                      : Colors.blue[200]),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(model.currentConv.chatMessages[index].senderId != SharedPrefsSerivce.currentUserId ?
                                model.currentConv.chatMessages[index].senderName + ": " + model.currentConv.chatMessages[index].message:
                                (model.currentConv.chatMessages[index].message),
                                  style: TextStyle(fontSize: 15),
                                ),
                              )),
                        );

                      }),


                ],
              ),
            ),
          ],
        ),
      )),
      viewModelBuilder: () => ChatDetailModel(),

    );
  }
}
