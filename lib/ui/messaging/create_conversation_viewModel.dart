import 'dart:collection';
import 'dart:convert';
import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:application_de_supervision/models/conversationModel.dart';
import 'package:application_de_supervision/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class CreateConversationModel extends BaseViewModel {

  List<String> _names = Get.arguments["names"];
  List<User> _users = Get.arguments["users"];
  HashMap _selectedUsers = HashMap<int, User>();
  List<dynamic> _listOfSelected;
  Conversation _newConversation;
  String _description = "";
  String _ids = "";

  List<String> get names => _names;
  List<User> get users => _users;
  Conversation get newConversation => _newConversation;
  HashMap get selectedUsers => _selectedUsers;
  List<dynamic> get listOfSelected => _listOfSelected;
  String get description => _description;
  String get ids => _ids;


  Future<Conversation> createCurrentConv() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _ids = prefs.getInt("idUser").toString();
    _description = prefs.getString("firstName");
    for(User u in _listOfSelected)
      {
        _description= _description + ", " + u.firstName ;
        _ids = _ids + "," + u.id.toString();
      }
    _newConversation = await createConversation(Conversation(participantsIds: _ids, description: _description));
    return _newConversation;
  }
  void removeSelectedUser(User u){
    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& " + _selectedUsers.toString());
    _selectedUsers.removeWhere((key, value) => value.id == u.id);
     _listOfSelected = _selectedUsers.entries.map((e) => e.value).toList();
    notifyListeners();
    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& " + _selectedUsers.toString());
  }
  void updateSelectedUsers(int index){
    if(!_selectedUsers.containsKey(index))
    _selectedUsers.putIfAbsent(index, () => _users[index]);
    notifyListeners();
    print("UPDATEEEEEEEEEEEEEEEEEEEEEEEEEEED");
    _listOfSelected = _selectedUsers.entries.map((e) => e.value).toList();
    notifyListeners();
  }
  /*Future<Conversation> sendMessage() async {


    //print(_currentConv.chatMessages.last.message);
    _currentConv.chatMessages.add(_newConversation);
    Map<String,dynamic> json = _currentConv.toJson();
    Uri postDataUri = Uri.parse(fPostModifierConversationAdress);
    print(json);
    http.Response response = await http.post(postDataUri, body: jsonEncode(json),
        headers: {"Content-type": "application/json", "Connection":"keep-alive",
          "Accept": "application/json"});
    print(jsonEncode(json));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print("********************************************************" + body.toString());
      _currentConv = Conversation.fromJson(body);
      notifyListeners();
    }
    else{
      print(response.statusCode);
      throw "cant send message";
    }
  }*/

}
