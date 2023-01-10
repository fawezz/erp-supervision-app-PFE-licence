
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/ui/messaging/chat_detail_View.dart';
import 'package:application_de_supervision/widgets/chat_item.dart';
import 'package:auto_search/auto_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'package:application_de_supervision/widgets/conversation_list_item.dart';
import 'chat_viewFutureModel.dart';

class ChatView extends StatelessWidget {
  ChatView({Key key}) : super(key: key);

  //final GlobalKey<ConversationItemState> _myWidgetState = GlobalKey<ConversationItemState>();
  @override
  Widget build(BuildContext context) {
    //WidgetsBinding.instance.addPostFrameCallback((_) {});
    /*Navigator.push( context, MaterialPageRoute( builder: (context) => ChatDetailView()), ).then(
            (value) => _myWidgetState.currentState.updateState());*/

    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 56,
                decoration: BoxDecoration(color: Colors.cyan,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                        child: Text(
                          "Discussions",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed("/createConversation", arguments: {"names": model.generatedNames, "users" : model.users});
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10, right: 16),
                        padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.add,color: Colors.blue,size: 20,),
                            SizedBox(width: 2,),
                            Text("Créer nouvelle",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              model.conversations.length == 0
                  ? Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Text(
                          "Aucune conversation",
                          style: TextStyle(
                            color: Colors.blueGrey[200],
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Text(
                          "Commencer",
                          style: TextStyle(
                              color: Colors.blueGrey[200], fontSize: 22),
                        )
                      ],
                    )
                  : ChatItem(),
            ],
          ),
        ),
      )),
      viewModelBuilder: () => ChatViewFutureModel(),
    );
  }
}

/* Padding(
                        padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            contentPadding: EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade100
                                )
                            ),
                          ),
                        ),
                      ),*/
