import 'dart:async';
import 'dart:convert';

import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/app/sharedPrefsService.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jstomp/jstomp.dart';
import 'package:get/get.dart';

import 'Constants.dart';

StreamController<ChatMessage> streamController = StreamController<ChatMessage>.broadcast();
Stream messageStream = streamController.stream;

JStomp stomp = JStomp.instance;

void deconnectStomp(){
  stomp.destroy();
}
void subscribeStomp() async {
  print("entered connect function");
  try {
    //String id = SharedPrefsSerivce.currentUserId.toString();
    String id = SharedPrefsSerivce.prefs.getInt("idUser").toString();
    bool b = await stomp.init(url: fStompAdress,);

    if(b){
      await stomp.connection((value) async {
        print("connection opened...$value");
        if (await stomp.subscribP2P(["/user/$id/queue/messages"]))
          print("subscribed successfully to chat notification channel");
        else
          throw "can't subscribe to chat user destination";

        ///this needs to be worked on **LACKING**
        /*if (await stomp.subscribP2P(["/user/$id/queue/notifications"]))
          print("subscribed successfully to GPAO notification channel");
        else
          throw "can't subscribe to chat user destination";
      },
          onError: (value){print("connection error...$value");}*/
      });
    }
    //lezem na3raf lmsg jee from which adresss bech nconvertih message walla notificationGPAO
    await stomp.onMessageCallback((message) {
      getConversations();
      ChatMessage newMessage = ChatMessage.fromJson(jsonDecode(message));
      //newMessage.message = "hakuna matata";
      //newMessage.conversation = 30;
      streamController.add(newMessage);

      ///call notification
      ///only show notification if the sender is not the current user AND no conversation is open right now
      //print('current route: ' + Get.currentRoute);
      if(newMessage.senderId != int.parse(id) && Get.currentRoute != "/chatDetail" && Get.currentRoute != "") {
        String text = newMessage.senderName + ": " + newMessage.message;
        print(newMessage.toString());
        if(newMessage.description != null )
          showNotification("IMPACT EHD", newMessage.message);
        else
        showNotification("nouveau message ", text);
      }

      //print("UUUUUUUUUUUUUUUUUUUUUU" + u.toString());
    }
    );
  } catch (e, s) {
    print(s);
    print("caught stomp exception");
  }
  print("exited connect function");
}

/*void subscribeStream() {
  try{
    IOWebSocketChannel _channel= IOWebSocketChannel.connect(fWebsocketAdress);
    IOWebSocketChannel getChannel()=> _channel;
    print("connected");
    final StreamSubscription subscription = _channel.stream.listen(
            (data) => {showNotification(data)},
        onError: (err) {
          print(err.toString());
          print("errorrrrr in notification service");}
    );
  }catch(e){
    print(e.toString());
  }

}*/

int notifId =0;
FlutterLocalNotificationsPlugin localNotification;

void initializeNotif() async {
  AndroidInitializationSettings androidInitialize = new AndroidInitializationSettings('ic_launcher');
  IOSInitializationSettings IOSInitialize = new IOSInitializationSettings();
  InitializationSettings initializationSettings = new InitializationSettings(
      android: androidInitialize, iOS: IOSInitialize);
  localNotification= FlutterLocalNotificationsPlugin();
  localNotification.initialize(initializationSettings);
}

Future showNotification(String title, String data) async {
  //messageStream.listen((value) { print("in the streammmmmmmmmm " + value.toString());});
  print('Data: $data 1');
  AndroidNotificationDetails androidDetails = AndroidNotificationDetails("channelId", "local notification",
      "random description random description", importance: Importance.high, enableVibration: true,
      enableLights: true, ledColor: Colors.green, ledOffMs: 2,ledOnMs: 2);
  print('Data: $data 2');

  IOSNotificationDetails iosDetails = IOSNotificationDetails();
  print('Data: $data 3');

  NotificationDetails generalNotificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
  print('Data: $data 4');
////this is new
  /*const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
      '1', 'your channel name', 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false);
  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await localNotification.show(
      0, 'plain title', data, platformChannelSpecifics,
      payload: 'item x');*/

  await localNotification.show(notifId++, title, data, generalNotificationDetails);
  print('Data: $data 5');


}