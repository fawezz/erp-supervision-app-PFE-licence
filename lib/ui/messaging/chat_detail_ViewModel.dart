import 'dart:async';
import 'dart:convert';
import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/app/sharedPrefsService.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:application_de_supervision/models/conversationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:application_de_supervision/app/stompService.dart';



class ChatDetailModel extends StreamViewModel {


  ChatMessage _newMessage;

  ChatMessage get newMessage => _newMessage;

  set newMessage(ChatMessage value) {
    _newMessage = value;
  }

  //Conversation _currentConv = serviceConversations[Get.arguments["index"]];
  Conversation _currentConv = Get.arguments["currentConversation"];
  Conversation get currentConv => _currentConv;

  Conversation updatedConversation ;





  void sendMessage() async {
    _newMessage.conversation = _currentConv.id;
    sendNewMessage(_newMessage);
  }

  @override
  void onData(data) {
    print("111111111111111111111" + data.toString());
      //data is a chat message   data.senderId != SharedPrefsSerivce.currentUserId &&
    if( data.conversation == _currentConv.id)
      _currentConv.chatMessages.add(data);
  }

  @override

  Stream<ChatMessage> get stream => messageStream;

}


//print(_currentConv.chatMessages.last.message);
/*if(updatedConversation == null)
      updatedConversation = _currentConv;

    updatedConversation.chatMessages.add(_newMessage);
    Map<String,dynamic> json = updatedConversation.toJson();
    Uri postDataUri = Uri.parse(fPostModifierConversationAdress);
    print(json);
    http.Response response = await http.post(postDataUri, body: jsonEncode(json),
        headers: {"Content-type": "application/json", "Connection":"keep-alive",
          "Accept": "application/json"});
    //print(jsonEncode(json));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print("********************************************************" + body.toString());
      updatedConversation = Conversation.fromJson(body);
      //notifyListeners();
      getConversations();

      //print(_currentConv.toString());
      //print("made it to the end of send message");

     */