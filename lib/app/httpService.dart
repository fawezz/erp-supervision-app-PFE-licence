import 'dart:convert';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:application_de_supervision/models/clientCacheModel.dart';
import 'package:application_de_supervision/models/conversationModel.dart';
import 'package:application_de_supervision/models/notificationGpaoModel.dart';
import 'package:application_de_supervision/models/produitModel.dart';
import 'package:application_de_supervision/models/siteModel.dart';
import 'package:application_de_supervision/models/userModel.dart';
import 'package:application_de_supervision/models/critereModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


/////////////////////////////////////////////Getter Clients//////////////////////////////////////////////

Future<List<ClientCache>> getClientsCache() async {
  Uri getCacheClientUri = Uri.parse(fGetClientsCacheAdress);
  http.Response res = await http.get(getCacheClientUri);
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<ClientCache> clients = body.map((dynamic item) =>
        ClientCache.fromJson(item)).toList();
    return clients;
  } else {
    throw "cant get clients";
  }
}

/////////////////////////////////////////////Getter Produits///////////////////////////////////////////
Future<List<Produit>> getProduits() async {
  Uri getProduitUri = Uri.parse(fGetProduitsAdress);
  http.Response res = await http.get(getProduitUri);
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<Produit> produits = body.map((dynamic item) =>
        Produit.fromJson(item)).toList();
    //getReferenceProduits();
    return produits;
  } else {
    throw "cant get sites";
  }
}

/////////////////////////////////////////////Getter Sites///////////////////////////////////////////
Future<List<Site>> getSites() async {
  Uri getSiteUri = Uri.parse(fGetSitesAdress);
  http.Response res = await http.get(getSiteUri);
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<Site> sites = body.map((dynamic item) =>
        Site.fromJson(item)).toList();
    return sites;
  } else {
    throw "cant get sites";
  }
}

///////////////////////////////////////////////// GET Conversations////////////////////////////////////////////
List<Conversation> serviceConversations;
  Future<List<Conversation>> getConversations() async {
    //////////Concat current user id instead of :3 //////////////
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.getInt("idUser").toString();
    print(idUser);
    Uri _getDataUri = Uri.parse(fGetConversationsAdress + ":" + idUser);

    http.Response res = await http.get(_getDataUri);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      //print("#######################INSIDE GET CONVERSATIONS############################" +body.toString());

       serviceConversations = body.map((dynamic item) =>
          Conversation.fromJson(item)).toList();

      /*print(conversations.runtimeType.toString() +
          "###################################################" +
          conversations[0].description);*/
      return serviceConversations;
    } else {
      throw "cant get conversations";
    }
  }
///////////////////////////////////////////////// POST Create Conversation////////////////////////////////////////////
Future<Conversation> createConversation(Conversation newConversation) async {

  Uri _postDataUri = Uri.parse(fPostCreerConversationAdress);
  String params = jsonEncode(newConversation.toJson());
  http.Response response = await http.post(
      _postDataUri, body: params, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });

  if (response.statusCode == 200) {
    Map<String, dynamic> body = jsonDecode(response.body);
    newConversation = Conversation.fromJson(body);

    return newConversation;
  } else {
    throw "cant Create Conversation";
  }
}
//////////////////////////////////////////// GET Users ////////////////////////////////////////
Future<List<User>> getUsers() async{
  Uri _getDataUri = Uri.parse(fGetAllUsersAdress);

  http.Response res = await http.get(_getDataUri);
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    //print("==============================" + body.toString());
    List<User> users = body.map((dynamic item) =>
        User.fromJson(item)).toList();
    //print("==============================" + users.toString());

    return users;
  } else {
    throw "cant get users";
  }
}
//////////////////////////////////////////// send new Message ////////////////////////////////////////

Future<ChatMessage> sendNewMessage(ChatMessage newMessage) async {

  Map<String,dynamic> json = newMessage.toJson();
  Uri postDataUri = Uri.parse(fPostNewMessageConversationAdress);
  print(json);
  http.Response response = await http.post(postDataUri, body: jsonEncode(json),
      headers: {"Content-type": "application/json", "Connection":"keep-alive",
        "Accept": "application/json"});
  //print(jsonEncode(json));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    print("*******************************************************+" + body.toString());
    //updatedConversation = Conversation.fromJson(body);
    //notifyListeners();
    getConversations();

  }
  else{
    print(response.statusCode);
    throw "cant send message";
  }
}
//////////////////////////////////////////// GET NOTIFICATIONS (post fel 79i9a) ////////////////////////////////////////

List<NotificationGpao> serviceNotifications;
Future<List<NotificationGpao>> postNotifications() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String idUser = prefs.getInt("idUser").toString();
  //print(idUser);
  String parameters = jsonEncode(
      {"idUser": idUser})
  ;
  print("ENTERED POSTNOTIFICATIONS FUNCTION");
  print(parameters);
  Uri postNotificationUri = Uri.parse(fPostNotificationAdress);
  http.Response response = await http.post(postNotificationUri, body: parameters,
      headers: {"Content-type": "application/json", "Connection":"keep-alive",
        "Accept": "application/json"});
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    //print("http service: postNotfications methode : body is: " + body.toString());

    serviceNotifications = body.map((dynamic item) =>
        NotificationGpao.fromJson(item)).toList();
    print("http service: postNotification methode: result is: serviceNotifications.toString())");
    print("SERVICE NOTIFICATIONS IN FUCNTION/ " + serviceNotifications.toString());

    return serviceNotifications;
  }
  else{
    print(response.statusCode);
    throw "cant get notifications";
  }
}

//////////////////////////////////////////// GET Critere By Type  ////////////////////////////////////////
Future<List<Critere>> getCritereByType(String type) async{
  Uri _getDataUri = Uri.parse(fGetCritereByTypeAdress + ":" + type);

  http.Response res = await http.get(_getDataUri);
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    print("==============================" + body.toString());
    List<Critere> criteres = body.map((dynamic item) =>
        Critere.fromJson(item)).toList();
    print("==============================" + criteres.toString());

    return criteres;
  } else {
    throw "cant get Criteres By type in http service";
  }
}